//
//  RankNetManager.h
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankModel.h"

@interface RankNetManager : BaseNetManager

// http://api.zhuishushenqi.com/ranking/548e97e29fb698a01dc6ee6f?start=0&limit=100
+ (id)getBookID : (NSString *)ID start : (NSInteger)start kCompletionHandle;


@end
