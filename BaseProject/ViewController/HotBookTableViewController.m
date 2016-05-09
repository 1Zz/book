//
//  HotBookTableViewController.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotBookTableViewController.h"
#import "bookWallCell.h"
#import "BookViewModel.h"
#import "SubBookWallViewController.h"

#import "Factory.h"

#import "MobClick.h"
#import "MobClickSocialAnalytics.h"

@interface HotBookTableViewController ()

@property (nonatomic , strong) BookViewModel *bookVM;

@end

@implementation HotBookTableViewController

- (BookViewModel *)bookVM {
    if (!_bookVM) {
        _bookVM = [[BookViewModel alloc]initWithID:self.ID];
    }
    return _bookVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KUIViewColor;
    
    [self.tableView registerClass:[bookWallCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.bookVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView.header endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    [self.tableView.header beginRefreshing];

    [Factory addRigthItemToVC:self];
    [Factory addLeftItemToVC:self];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.bookVM.rowNumber;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    bookWallCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell.iconIV setImageWithURL:[self.bookVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"about_bad_feel"]];
    cell.titleLb.text = [self.bookVM titleForRow:indexPath.row];
    cell.shortIntroLb.text = [self.bookVM shortIntroForRow:indexPath.row];
    cell.authorLb.text = [self.bookVM authorForRow:indexPath.row];
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SubBookWallViewController *books = [[SubBookWallViewController alloc]initWithBookID:[self.bookVM subBooksForRow:indexPath.row]];
    books.shortIntro = [self.bookVM shortIntroForRow:indexPath.row];
    [self.navigationController pushViewController:books animated:YES];
    
}

// 统计用户进入此界面的时长和频率
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"HotBookTableViewController"];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"HotBookTableViewController"];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
