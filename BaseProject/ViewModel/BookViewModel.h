//
//  BookViewModel.h
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "RankNetManager.h"

@interface BookViewModel : BaseViewModel

- (instancetype)initWithID : (NSString *)ID;
@property (nonatomic , strong) NSString *ID;

@property (nonatomic) NSInteger start;

@property (nonatomic , strong) NSString *TopTitle;


@property (nonatomic) NSInteger rowNumber;
- (NSURL *)coverURLForRow : (NSInteger)row;  //  图片
- (NSString *)titleForRow : (NSInteger)row;  // 书名
- (NSString *)authorForRow : (NSInteger)row;  // 作者
- (NSString *)shortIntroForRow : (NSInteger)row; // 简介
- (NSString *)subBooksForRow : (NSInteger)row; // ID;


@end
