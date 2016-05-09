//
//  SubClassModel.h
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class subBooksModel;
@interface SubClassModel : BaseModel

@property (nonatomic, strong) NSArray<subBooksModel *> *books;

@property (nonatomic, assign) BOOL ok;

@end
@interface subBooksModel : NSObject

@property (nonatomic, copy) NSString *majorCate;

@property (nonatomic, copy) NSString *minorCate;

@property (nonatomic, assign) CGFloat retentionRatio;

@property (nonatomic, copy) NSString *cat;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, strong) NSArray<NSString *> *tags;

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger latelyFollower;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *lastChapter;

@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *shortIntro;

@end

