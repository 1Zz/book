//
//  RankModel.h
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class RankingModel,BooksModel;
@interface RankModel : BaseModel

@property (nonatomic, strong) RankingModel *ranking;

@property (nonatomic, assign) BOOL ok;

@end
@interface RankingModel : NSObject

@property (nonatomic, copy) NSString *updated;

@property (nonatomic, strong) NSArray *operateBooks;

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, assign) BOOL aNew;//new;

@property (nonatomic, strong) NSArray<BooksModel *> *books;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, assign) NSInteger __v;

@property (nonatomic, assign) BOOL collapse;

@property (nonatomic, copy) NSString *gender;

@end

@interface BooksModel : NSObject

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *shortIntro;

@property (nonatomic, assign) NSInteger banned;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger latelyFollower;

@property (nonatomic, copy) NSString *cat;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, assign) CGFloat retentionRatio;

@end

