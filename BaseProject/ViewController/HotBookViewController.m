//
//  HotBookViewController.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotBookViewController.h"
#import "iCarousel.h"

#import "Factory.h"

#import "MobClick.h"
#import "MobClickSocialAnalytics.h"

#import "HotBookTableViewController.h"


// 起点 http://api.zhuishushenqi.com/ranking/548e9883c58cff632353e731
#define qidainID  @"54d4306c321052167dfb75e4"
//纵横：http://api.zhuishushenqi.com/ranking/548e98c55beb6f0458d652ab
#define zonghengID @"54d430962c12d3740e4a3ed2"
//17K：http://api.zhuishushenqi.com/ranking/548e9915fb8190536fb097d0
#define _17K   @"54d430e9a8cb149d07282496"
//创世： http://api.zhuishushenqi.com/ranking/548e99423b5a77135a798b58
#define chuangshi   @"548e99423b5a77135a798b58"
//潇湘： http://api.zhuishushenqi.com/ranking/549d1ad11cd9d5d26ee1b6c2
#define xiaoxiang   @"550b8397de12381038ad8c0b"

@interface HotBookViewController ()<iCarouselDataSource , iCarouselDelegate>

@property (nonatomic , strong) iCarousel *ic;
@property (nonatomic , strong) NSArray *imageName;

@end

@implementation HotBookViewController

+ (UINavigationController *)standardHotBook {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HotBookViewController *vc = [HotBookViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

- (NSArray *)imageName {
    if (!_imageName) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Image" ofType:@"bundle"];
        NSFileManager *manager = [NSFileManager defaultManager];
        _imageName = [manager subpathsAtPath:path];
    }
    return _imageName;
}

- (iCarousel *)ic {
    if (!_ic) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = 3; // 3D效果
        _ic.autoscroll = 0.5;
        _ic.scrollSpeed = 0;  // 滚动速度
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = KUIViewColor;
    self.title = @"热门书城";
    
    [Factory addMenuItemToVC:self];
    
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark -- ic
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.imageName.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW/2, kWindowH/2)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Image" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:self.imageName[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
    HotBookTableViewController *wallVC = [[HotBookTableViewController alloc]init];
    switch (index) {
        case 0:NSLog(@"17k书城");wallVC.ID = _17K;wallVC.title = @"17K书城";break;
        case 1:NSLog(@"起点");wallVC.ID = qidainID;wallVC.title = @"起点中文网";break;
        case 2:NSLog(@"创世");wallVC.ID = chuangshi;wallVC.title = @"创世中文网"; break;
        case 3:NSLog(@"潇湘");wallVC.ID = xiaoxiang;wallVC.title = @"潇湘书院";break;
        case 4:NSLog(@"纵横");wallVC.ID = zonghengID;wallVC.title = @"纵横中文网";break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:wallVC animated:YES];
}

// 统计用户进入此界面的时长和频率
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"HotBookViewController"];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"HotBookViewController"];
}

@end
