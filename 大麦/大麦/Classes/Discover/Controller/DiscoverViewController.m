//
//  DiscoverViewController.m
//  大麦
//
//  Created by 洪欣 on 16/12/13.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverHeaderView.h"
#import "DiscoverViewModel.h"
#import "DiscoverViewCell.h"
@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) DiscoverHeaderView *headerView;
@property (strong, nonatomic) NSMutableArray *list;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发现";
    
    [self setup];
    
    HXWeakSelf
    [DiscoverViewModel getHeaderDataModel:^(DiscoverHeaderModel *model) {
        weakSelf.headerView.model = model;
    } Failure:^(NSError *error) {
        
    }];
    
    [DiscoverViewModel getCellDataPage:@"1" ModelList:^(NSArray *array, NSInteger tatol) {
        weakSelf.list = [NSMutableArray arrayWithArray:array];
        [weakSelf.tableView reloadData];
    } Failure:^(NSError *error) {
        
    }];
}

- (void)setup
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 49, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[DiscoverViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    DiscoverHeaderView *headerView = [[DiscoverHeaderView alloc] init];
    headerView.height = 300;
    tableView.tableHeaderView = headerView;
    self.headerView = headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoverViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.model = self.list[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 235;
}



@end
