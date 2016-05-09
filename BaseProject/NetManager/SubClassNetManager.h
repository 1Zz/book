//
//  SubClassNetManager.h
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "SubClassModel.h"   

@interface SubClassNetManager : BaseNetManager

//   http://api.zhuishushenqi.com/book/by-tag?tag=%E7%8E%84%E5%B9%BB&start=0&limit=50
//   http://api.zhuishushenqi.com/book/by-tag?tag=玄幻&start=0&limit=50


+ (id)getSubClassWithTag : (NSString *)tag start : (NSInteger)start kCompletionHandle;

@end
