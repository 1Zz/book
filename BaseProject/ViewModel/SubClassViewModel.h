//
//  SubClassViewModel.h
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "SubClassNetManager.h"

@interface SubClassViewModel : BaseViewModel

- (instancetype)initWithTag : (NSString *)tag;
@property (nonatomic , strong) NSString *tag;
@property (nonatomic) NSInteger start;

@property (nonatomic) NSInteger rowNumber;


- (NSURL *)coverForRow : (NSInteger)row;  //  图片
- (NSString *)authorFOrRow : (NSInteger)row;  // 作者
- (NSString *)titleForRow : (NSInteger)row; // 书名
- (NSString *)shortIntroForRow : (NSInteger)row;  // 简介
- (NSString *)lastChapterForRow : (NSInteger)row;  // 最新章节
- (NSString *)IDForRow : (NSInteger)row; // id;


@end
