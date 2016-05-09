//
//  ClassifyNetManager.h
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ManClassModel.h"

@interface ClassifyNetManager : BaseNetManager


// http://api.zhuishushenqi.com/tag?gender=male

+ (id)getClassifyWithGender : (NSString *)gender kCompletionHandle;


@end
