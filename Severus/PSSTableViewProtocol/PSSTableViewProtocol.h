//
//  PSSTableViewProtocol.h
//  PSSTableViewProtocol
//
//  Created by Dai Qinfu on 16/1/21.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Builder.h"
#import "PSSReusableViewPotocol.h"

#import "ReactiveCocoa.h"
#import "RACEXTScope.h"

typedef NSInteger(^NumberOfRows)(NSInteger section);
typedef CGFloat(^HeightBlock)(NSIndexPath *indexPath);

typedef BOOL(^ViewFilter)(NSIndexPath *indexPath);
typedef id(^ViewData)(NSIndexPath *indexPath);

@interface PSSTableViewProtocol : NSObject <UITableViewDelegate, UITableViewDataSource, NSObjectBuilderProtocol>

/**
 *  <#Description#>
 */
@property (strong, nonatomic) RACSubject *didSelectRowAtIndexPath;

/**
 *  <#Description#>
 */
@property (assign, nonatomic) NSInteger  numberOfSections;

/**
 *  注册每个Section的行数
 *
 *  @param block <#block description#>
 */
- (void)registerNumberOfRows:(NumberOfRows)block;

/**
 *  注册一个用于显示的TableViewCell
 *
 *  @param cellClass   <#cellClass description#>
 *  @param tableView   <#tableView description#>
 *  @param block       <#block description#>
 *  @param heightBlock <#heightBlock description#>
 *  @param dataBlock   <#dataBlock description#>
 */
- (void)registerCell:(Class <PSSReusableViewPotocol> )cellClass
         onTableView:(UITableView *)tableView
              filter:(ViewFilter)block
              height:(HeightBlock)heightBlock
                data:(ViewData)dataBlock;

/**
 *  注册一个用于显示的TableViewHeader
 *
 *  @param viewClass   <#viewClass description#>
 *  @param tableView   <#tableView description#>
 *  @param block       <#block description#>
 *  @param heightBlock <#heightBlock description#>
 *  @param dataBlock   <#dataBlock description#>
 */
- (void)registerHeaderView:(Class <PSSReusableViewPotocol> )viewClass
               onTableView:(UITableView *)tableView
                    filter:(ViewFilter)block
                    height:(HeightBlock)heightBlock
                      data:(ViewData)dataBlock;

/**
 *  注册一个用于显示的TableViewFooter
 *
 *  @param viewClass   <#viewClass description#>
 *  @param tableView   <#tableView description#>
 *  @param block       <#block description#>
 *  @param heightBlock <#heightBlock description#>
 *  @param dataBlock   <#dataBlock description#>
 */
- (void)registerFooterView:(Class <PSSReusableViewPotocol> )viewClass
               onTableView:(UITableView *)tableView
                    filter:(ViewFilter)block
                    height:(HeightBlock)heightBlock
                      data:(ViewData)dataBlock;

@end
