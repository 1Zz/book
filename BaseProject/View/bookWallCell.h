//
//  bookWallCell.h
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bookWallCell : UITableViewCell

@property (nonatomic , strong) UIImageView *iconIV; //  图片
@property (nonatomic , strong) UILabel *titleLb; //  题目
@property (nonatomic , strong) UILabel *shortIntroLb; // 简介
@property (nonatomic , strong) UILabel *authorLb; // 作者
@property (nonatomic , strong) UILabel *chapterLb; // 章节

@end
