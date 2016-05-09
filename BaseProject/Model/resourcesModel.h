//
//  resourcesModel.h
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface resourcesModel : BaseModel

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *lastChapter;

@property (nonatomic, assign) BOOL isCharge;

@property (nonatomic, copy) NSString *updated;

@property (nonatomic, assign) BOOL starting;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger chaptersCount;

@property (nonatomic, copy) NSString *host;

@property (nonatomic, copy) NSString *name;

@end

