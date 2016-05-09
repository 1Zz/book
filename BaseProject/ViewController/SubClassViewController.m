//
//  SubClassViewController.m
//  BaseProject
//
//  Created by ios－29 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SubClassViewController.h"
#import "bookWallCell.h"
#import "SubClassViewModel.h"
#import "SubBookWallViewController.h"

#import "Factory.h"

#import "MobClick.h"
#import "MobClickSocialAnalytics.h"

@interface SubClassViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic , strong) SubClassViewModel *subVM;
@end

@implementation SubClassViewController

- (SubClassViewModel *)subVM {
    if (!_subVM) {
        _subVM = [[SubClassViewModel alloc]initWithTag:self.tag];
    }
    return _subVM;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[bookWallCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

kRemoveCellSeparator
#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    bookWallCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.subVM titleForRow:indexPath.row];
    [cell.iconIV setImageWithURL:[self.subVM coverForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"about_bad_feel"]];
    cell.shortIntroLb.text = [self.subVM shortIntroForRow:indexPath.row];
    cell.authorLb.text = [self.subVM authorFOrRow:indexPath.row];
    cell.chapterLb.text = [self.subVM lastChapterForRow:indexPath.row];
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SubBookWallViewController *subBookVC = [[SubBookWallViewController alloc]initWithBookID:[self.subVM IDForRow:indexPath.row]];
    subBookVC.shortIntro = [self.subVM shortIntroForRow:indexPath.row];
    [self.navigationController pushViewController:subBookVC animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = KUIViewColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.subVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.subVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    
    [Factory addLeftItemToVC:self];
    [Factory addRigthItemToVC:self];
}

// 统计用户进入此界面的时长和频率
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"SubClassViewController"];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"SubClassViewController"];
}



@end
