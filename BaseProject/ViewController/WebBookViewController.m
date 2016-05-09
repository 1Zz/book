//
//  WebBookViewController.m
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WebBookViewController.h"

#import "Factory.h"

#import "MobClick.h"
#import "MobClickSocialAnalytics.h"

#define http   @"http://m.baidu.com/s?word=%@"

@interface WebBookViewController ()<UIWebViewDelegate>
@property (nonatomic , strong) UIWebView *webView;
@end

@implementation WebBookViewController

- (UIWebView *)webView {
    if (!_webView) {//用懒加载方式 webView显示网页的
        _webView = [UIWebView new];
        NSString *str = [_name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *path = [NSString stringWithFormat:@"https://www.baidu.com/from=844b/s?word=%@&ts=7069763&t_kt=0&rsv_iqid=11598231951864004761&sa=ihr_1&ms=1&rsv_sug4=1847&ss=001",str];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
        NSLog(@"str = %@",path);
        [_webView setScalesPageToFit:YES];//set放置的意思 scales等级的意思 Page页 To去 Fit健康的
        _webView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {//mas摩擦的意思 make词典 Constraints约束
        make.edges.mas_equalTo(0);
    }];
    self.title = self.name;
    NSString *str = [_name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//By通过的意思，adding添加的意思 Percent %  Escapes 逃脱 using使用 Encoding编码风格

    NSLog(@"name:%@",str);
    [Factory addLeftItemToVC:self];//left左 Item项目  To去  
    [Factory addRigthItemToVC:self];
}
#pragma mark --webView
//showld 应该的意思 start起点 With随着  navigation导航 Type类型
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
//DId已经完成  load加载的意思  ||| show显示      Progress进展
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始加载");
    [self showProgress];
}
//hide隐藏 with一起
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"加载结束");
    [self hideProgress];
}
//Fail失败 
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    NSLog(@"加载失败");
    NSLog(@"%@",error.userInfo);
    [self hideProgress];
}

// 统计用户进入此界面的时长和频率
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"WebBookViewController"];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"WebBookViewController"];
}


@end
