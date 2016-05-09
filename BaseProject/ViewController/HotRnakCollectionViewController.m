//
//  HotRnakCollectionViewController.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotRnakCollectionViewController.h"
#import "BookViewModel.h"
#import "SubBookWallViewController.h"

#import "Factory.h"
#import "PSCollectionView.h"

#import "MobClick.h"
#import "MobClickSocialAnalytics.h"

#define rankID  @"54d42d92321052167dfb75e3"
// http://api.zhuishushenqi.com/ranking/548e97e29fb698a01dc6ee6f?start=0&limit=100

@interface HotRnakCollectionViewController ()<UIScrollViewDelegate , PSCollectionViewDataSource , PSCollectionViewDelegate>

@property (nonatomic , strong) BookViewModel *boosVM;
@property (nonatomic , strong) PSCollectionView *psCollect;

@end

@implementation HotRnakCollectionViewController

- (BookViewModel *)boosVM {
    if (!_boosVM) {
        _boosVM = [[BookViewModel alloc]initWithID:rankID];
    }
    return _boosVM;
}

+ (UINavigationController *)standardHotRank {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    HotRnakCollectionViewController *vc = [[HotRnakCollectionViewController alloc]init];;;
    navi = [[UINavigationController alloc]initWithRootViewController:vc];
});
    return navi;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KUIViewColor;
    self.title = @"热门书籍";
    [Factory addMenuItemToVC:self];
    
    
    self.psCollect = [[PSCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.psCollect.delegate = self;
    self.psCollect.collectionViewDataSource = self;
    self.psCollect.collectionViewDelegate = self;
    [self.view addSubview:self.psCollect];
    
    self.psCollect.numColsPortrait = 3;
    
    self.psCollect.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.boosVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.description];
            }
            [self.psCollect reloadData];
            [self.psCollect.header endRefreshing];
        }];
    }];
    [self.psCollect.header beginRefreshing];

}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return self.boosVM.rowNumber;
}

- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [[PSCollectionViewCell alloc]initWithFrame:CGRectZero];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [cell addSubview:imageView];
        imageView.tag = 10;
        
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:15];
        [cell addSubview:label];
        label.tag = 20;
    }
    
    cell.frame = CGRectMake(0, 0, kWindowW / 3 - 10, [self collectionView:collectionView heightForRowAtIndex:index]);
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:10];
    imageView.frame = CGRectMake(0, 0, cell.frame.size.width,cell.frame.size.height - 30);
    [imageView setImageWithURL:[self.boosVM coverURLForRow:index] placeholderImage:[UIImage imageNamed:@"about_bad_feel"]];
    
    UILabel *label = (UILabel *)[cell viewWithTag:20];
    label.frame = CGRectMake(0, imageView.bounds.size.height, imageView.bounds.size.width, 30);
    label.text = [self.boosVM titleForRow:index];
    
    return cell;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    
    return 150;
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index {
    NSLog(@"%ld",(long)index);
    
    SubBookWallViewController *books = [[SubBookWallViewController alloc]initWithBookID:[self.boosVM subBooksForRow:index]];
    books.shortIntro = [self.boosVM shortIntroForRow:index];
    [self.navigationController pushViewController:books animated:YES];
}

// 统计用户进入此界面的时长和频率
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"HotRnakCollectionViewController"];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"HotRnakCollectionViewController"];
}



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
