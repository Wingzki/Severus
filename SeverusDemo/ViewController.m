//
//  ViewController.m
//  SeverusDemo
//
//  Created by Dai Qinfu on 16/1/26.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import "ViewController.h"
#import "PSSTableViewProtocol.h"

@interface ViewController ()

@property (strong, nonatomic) UITableView          *tableView;
@property (strong, nonatomic) PSSTableViewProtocol *tableViewProtocol;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableViewProtocol = [PSSTableViewProtocol createWithBuilder:^(PSSTableViewProtocol *builder) {
        
        builder.numberOfSections = 1;
        
    }];
    
    [self.tableViewProtocol registerNumberOfRows:^NSInteger(NSInteger section) {
     
        return 20;
        
    }];
    
    [self.tableViewProtocol registerCell:[UITableViewCell class] onTableView:self.tableView filter:^BOOL(NSIndexPath *indexPath) {
        
        return indexPath.row % 2 == 1;
        
    } height:^CGFloat(NSIndexPath *indexPath) {
        
        return 80;
        
    } data:^id(NSIndexPath *indexPath) {
        
        return @"haha";
        
    }];
    
    self.tableView.delegate   = self.tableViewProtocol;
    self.tableView.dataSource = self.tableViewProtocol;
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
