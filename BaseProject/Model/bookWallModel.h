//
//  bookWallModel.h
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface bookWallModel : BaseModel

@property (nonatomic, copy) NSString *creater;

@property (nonatomic, assign) NSInteger serializeWordCount;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<NSString *> *tags;

@property (nonatomic, assign) NSInteger postCount;

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *retentionRatio;

@property (nonatomic, assign) NSInteger wordCount;

@property (nonatomic, assign) BOOL isSerial;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *updated;

@property (nonatomic, strong) NSArray<NSString *> *gender;

@property (nonatomic, copy) NSString *minorCate;

@property (nonatomic, copy) NSString *longIntro;

@property (nonatomic, copy) NSString *cat;

@property (nonatomic, copy) NSString *lastChapter;

@property (nonatomic, assign) NSInteger chaptersCount;

@property (nonatomic, assign) NSInteger latelyFollower;

@property (nonatomic, assign) NSInteger followerCount;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *majorCate;

@end
