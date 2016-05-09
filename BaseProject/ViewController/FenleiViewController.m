//
//  FenleiViewController.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FenleiViewController.h"
#import "ClassifyNetManager.h"
#import "classifyViewModel.h"
#import "SubClassViewController.h"

#import "Factory.h"

#import "MobClick.h"
#import "MobClickSocialAnalytics.h"



@interface FenleiViewController ()<UITableViewDataSource , UITableViewDelegate>
@property (nonatomic , strong) UISegmentedControl *segmented;  // 分页控件
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) classifyViewModel *classVM;  //

@property (nonatomic , strong) NSString *gender; // 分类
@end

@implementation FenleiViewController

- (classifyViewModel *)classVM {
    if (!_classVM) {
        _classVM = [[classifyViewModel alloc]initWithGender:_gender];
    }
    return _classVM;
}

+ (UINavigationController *)standardFenLei {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FenleiViewController *vc = [FenleiViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

- (UISegmentedControl *)segmented {
    if (!_segmented) {
        _segmented = [[UISegmentedControl alloc]initWithItems:@[@"男生",@"女生"]];
        [_segmented addTarget:self action:@selector(selector:) forControlEvents:UIControlEventValueChanged];
        _segmented.momentary = YES;
    }
    return _segmented;
}

- (void)selector:(id)sender {
    self.segmented = (UISegmentedControl*)sender;
    switch (self.segmented.selectedSegmentIndex) {
        case 0: {_classVM = [[classifyViewModel alloc]initWithGender:@"male"];
            [self.classVM refreshDataCompletionHandle:^(NSError *error) {
                [self.tableView reloadData];
            }];}; break;
        case 1: {_classVM = [[classifyViewModel alloc]initWithGender:@"female"];
            [self.classVM refreshDataCompletionHandle:^(NSError *error) {
                [self.tableView reloadData];
            }];}; break;
            
        default:
            break;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gender  = @"male";
    self.view.backgroundColor = KUIViewColor;
    self.navigationItem.titleView = self.segmented;  //添加到导航栏中
    [Factory addMenuItemToVC:self];
    
    [self.classVM refreshDataCompletionHandle:^(NSError *error) {
        [self.tableView reloadData];
    }];
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.classVM.rowNumber;
}
kRemoveCellSeparator
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.classVM.dataArr[indexPath.row];
    
    
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SubClassViewController *subVC = [[SubClassViewController alloc]init];
    subVC.title = self.classVM.dataArr[indexPath.row];
    subVC.tag = self.classVM.dataArr[indexPath.row];
    
    [self.navigationController pushViewController:subVC animated:YES];
    
    
}

// 统计用户进入此界面的时长和频率
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"FenleiViewController"];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"FenleiViewController"];
}


@end
