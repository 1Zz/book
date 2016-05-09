//
//  resouresNetManager.h
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "resourcesModel.h"

@interface resouresNetManager : BaseNetManager

// http://api.zhuishushenqi.com/toc?view=summary&book=531169b3173bfacb4904ca67
+ (id)getResouresBookID : (NSString *)ID kCompletionHandle;

@end
