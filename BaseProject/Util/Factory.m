//
//  Factory.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory
+ (void)addMenuItemToVC:(UIViewController *)vc {
    UIButton *btu = [UIButton buttonWithType:UIButtonTypeSystem];
    [btu setBackgroundImage:[UIImage imageNamed:@"find_campus"] forState:UIControlStateNormal];
    [btu setBackgroundImage:[UIImage imageNamed:@"find_campus"] forState:UIControlStateHighlighted];
    btu.frame = CGRectMake(0, 0, 30, 30);
    [btu bk_addEventHandler:^(id sender) {
        [vc presentLeftMenuViewController:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btu];
    // 使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}
+ (void)addRigthItemToVC : (UIViewController *)vc {
    UIButton *btu = [UIButton buttonWithType:UIButtonTypeSystem];
    [btu setBackgroundImage:[UIImage imageNamed:@"find_campus"] forState:UIControlStateNormal];
    [btu setBackgroundImage:[UIImage imageNamed:@"find_campus"] forState:UIControlStateHighlighted];
    btu.frame = CGRectMake(0, 0, 30, 30);
    [btu bk_addEventHandler:^(id sender) {
        [vc presentLeftMenuViewController:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btu];
    // 使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.rightBarButtonItems = @[spaceItem,menuItem];
}

+ (void)addLeftItemToVC : (UIViewController *)vc {
    
    UIButton *btu = [UIButton buttonWithType:UIButtonTypeSystem];
    [btu setBackgroundImage:[UIImage imageNamed:@"find_other"] forState:UIControlStateNormal];
    [btu setBackgroundImage:[UIImage imageNamed:@"find_other"] forState:UIControlStateHighlighted];
    btu.frame = CGRectMake(0, 0, 30, 30);
    [btu bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btu];
    // 使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
    
}
@end
