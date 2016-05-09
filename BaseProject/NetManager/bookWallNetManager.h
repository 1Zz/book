//
//  bookWallNetManager.h
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "bookWallModel.h"

@interface bookWallNetManager : BaseNetManager

// http://api.zhuishushenqi.com/book/55c9a13af247ad1256039591
+ (id)getSubBookID : (NSString *)ID kCompletionHandle;


@end
