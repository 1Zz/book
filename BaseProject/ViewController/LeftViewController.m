//
//  LeftViewController.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "HotRnakCollectionViewController.h"
#import "FenleiViewController.h"
#import "HotBookViewController.h"


@interface LeftViewController ()

@property (nonatomic , strong) FUIButton *bookButton;
@property (nonatomic , strong) FUIButton *rankButton;
@property (nonatomic , strong) FUIButton *fenLeiButton;

@end

@implementation LeftViewController

- (FUIButton *)bookButton {
    if (!_bookButton) {
        _bookButton = [FUIButton buttonWithType:UIButtonTypeSystem];
        _bookButton.shadowHeight = 2.0f;
        _bookButton.cornerRadius = 10.0f;
        _bookButton.buttonColor = KButUIColor;
        _bookButton.shadowColor = KButUIColor;
        [_bookButton setTitle:@"热门书城" forState:UIControlStateNormal];
        _bookButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_bookButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_bookButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_bookButton bk_addEventHandler:^(id sender) {
            [self.sideMenuViewController setContentViewController:[HotBookViewController standardHotBook] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _bookButton;
}
- (FUIButton *)rankButton {
    if (!_rankButton) {
        _rankButton = [FUIButton buttonWithType:UIButtonTypeSystem];
        _rankButton.shadowHeight = 2.0f;
        _rankButton.cornerRadius = 10.0f;
        _rankButton.buttonColor = KButUIColor;
        _rankButton.shadowColor = KButUIColor;
        [_rankButton setTitle:@"热门书籍" forState:UIControlStateNormal];
        _rankButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_rankButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_rankButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_rankButton bk_addEventHandler:^(id sender) {
            [self.sideMenuViewController setContentViewController:[HotRnakCollectionViewController standardHotRank] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _rankButton;
}
- (FUIButton *)fenLeiButton {
    if (!_fenLeiButton) {
        _fenLeiButton = [FUIButton buttonWithType:UIButtonTypeSystem];
        _fenLeiButton.shadowHeight = 2.0f;
        _fenLeiButton.cornerRadius = 10.0f;
        _fenLeiButton.buttonColor = KButUIColor;
        _fenLeiButton.shadowColor = KButUIColor;
        [_fenLeiButton setTitle:@"分类查看" forState:UIControlStateNormal];
        _fenLeiButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_fenLeiButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_fenLeiButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_fenLeiButton bk_addEventHandler:^(id sender) {
            [self.sideMenuViewController setContentViewController:[FenleiViewController standardFenLei] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _fenLeiButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    [self.view addSubview:self.rankButton];
    [self.rankButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.bookButton];
    [self.bookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.top.mas_equalTo(_rankButton.mas_top).mas_equalTo(-60);
        make.left.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.fenLeiButton];
    [self.fenLeiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.bottom.mas_equalTo(_rankButton.mas_bottom).mas_equalTo(60);
        make.left.mas_equalTo(40);
    }];
    
}


@end
