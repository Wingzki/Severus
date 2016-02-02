//
//  PSSTableViewProtocol.m
//  PSSTableViewProtocol
//
//  Created by Dai Qinfu on 16/1/21.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import "PSSTableViewProtocol.h"

#define MINFLOAT 0.0001;

static NSString * const kRandomAlphabet = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
static NSString * const kNormalCell     = @"kNormalCell";

@interface PSSTableViewProtocol ()

@property (strong, nonatomic) NSMutableArray      *cellFilterArray;
@property (strong, nonatomic) NSMutableDictionary *cellIdentifierDic;
@property (strong, nonatomic) NSMutableDictionary *cellDataDic;
@property (strong, nonatomic) NSMutableDictionary *cellHeightDic;

@property (copy  , nonatomic) NumberOfRows numberOfRows;

@end

@implementation PSSTableViewProtocol

- (void)chackParameters {
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _numberOfSections  = 1;
        
        _cellFilterArray   = [NSMutableArray array];
        _cellIdentifierDic = [NSMutableDictionary dictionary];
        _cellDataDic       = [NSMutableDictionary dictionary];
        _cellHeightDic     = [NSMutableDictionary dictionary];
        
        _didSelectRowAtIndexPath = [RACSubject subject];
        
    }
    return self;
}

- (void)registerNumberOfRows:(NumberOfRows)block; {
    
    if (block) {
        
        self.numberOfRows = [block copy];
        
    }
    
}

- (void)registerCell:(Class <PSSReusableViewPotocol> )cellClass
         onTableView:(UITableView *)tableView
              filter:(ViewFilter)filterBlock
              height:(HeightBlock)heightBlock
                data:(ViewData)dataBlock; {
    
    NSString *randomIdentifier = [self randomString];
    
    while ([self isIdentifierExist:randomIdentifier]) {
        
        randomIdentifier = [self randomString];
        
    }
    
    [tableView registerClass:cellClass forCellReuseIdentifier:randomIdentifier];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kNormalCell];
    
    [self.cellFilterArray addObject:[filterBlock copy]];
    [self.cellIdentifierDic setObject:randomIdentifier forKey:filterBlock];
    [self.cellDataDic setObject:[dataBlock copy] forKey:randomIdentifier];
    [self.cellHeightDic setObject:[heightBlock copy] forKey:randomIdentifier];
    
}

- (void)registerHeaderView:(Class <PSSReusableViewPotocol> )viewClass
               onTableView:(UITableView *)tableView
                    filter:(ViewFilter)block
                    height:(HeightBlock)heightBlock
                      data:(ViewData)dataBlock; {
    
}

- (void)registerFooterView:(Class <PSSReusableViewPotocol> )viewClass
               onTableView:(UITableView *)tableView
                    filter:(ViewFilter)block
                    height:(HeightBlock)heightBlock
                      data:(ViewData)dataBlock; {
    
}

#pragma mark - shouldOverWrite

- (void)cellWillReturned:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - private

- (UITableViewCell *)getCell:(NSString *)identifier form:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell <PSSReusableViewPotocol> *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ([cell respondsToSelector:@selector(bindingData:)]) {
        
        ViewData block = self.cellDataDic[identifier];
        
        if (block) {
            
            [cell bindingData:block(indexPath)];
            
        }
        
    }
    
    return cell;
    
}

- (NSString *)randomString {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity:10];
    
    for (int i = 0; i < 10; i++) {
        
        [randomString appendFormat: @"%C", [kRandomAlphabet characterAtIndex:arc4random_uniform((u_int32_t)[kRandomAlphabet length])]];
        
    }
    
    return randomString;
}

- (BOOL)isIdentifierExist:(NSString *)identifier {
    
    for (NSString *temp in [self.cellIdentifierDic allValues]) {
        
        if ([temp isEqualToString:identifier]) {
            return  YES;
        }
        
    }
    
    return NO;
    
}

- (NSString *)identifierWithIndexPath:(NSIndexPath *)indexPath {
    
    for (ViewFilter block in self.cellFilterArray) {
        
        BOOL shouldReturnCell = block(indexPath);
        
        if (shouldReturnCell) {
            
            return [self.cellIdentifierDic objectForKey:block];
            
        }
        
    }
    
    return nil;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.numberOfSections;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.numberOfRows) {
        
        return self.numberOfRows(section);
        
    }
    
    NSLog(@"NumberOfRowsInSection do not be registered : %@", @(section));
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [self identifierWithIndexPath:indexPath];
    
    UITableViewCell *cell;
    
    if (identifier) {
        
        cell = [self getCell:identifier form:tableView indexPath:indexPath];
        
    }else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:kNormalCell];
        
    }
    
    [self cellWillReturned:cell indexPath:indexPath];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.didSelectRowAtIndexPath sendNext:indexPath];
    
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section; {
    
    return [[UIView alloc] init];
    
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section; {
    
    return [[UIView alloc] init];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    NSString *identifier = [self identifierWithIndexPath:indexPath];
    
    HeightBlock block = self.cellHeightDic[identifier];
    
    if (block) {
        
        return block(indexPath);
        
    }
    
    return 44;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section; {
    
    return MINFLOAT;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section; {
    
    return MINFLOAT;
    
}

@end
