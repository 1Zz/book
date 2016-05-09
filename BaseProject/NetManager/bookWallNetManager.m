//
//  bookWallNetManager.m
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "bookWallNetManager.h"

// http://api.zhuishushenqi.com/book/55c9a13af247ad1256039591
#define bookID  @"http://api.zhuishushenqi.com/book/%@"


@implementation bookWallNetManager

+ (id)getSubBookID:(NSString *)ID completionHandle:(void (^)(id, NSError *))completionHandle {
    NSString *path = [NSString stringWithFormat:bookID,ID];
    return [self GET:path parameters:nil completionHandler:^(bookWallModel *responseObj, NSError *error) {
        completionHandle ([bookWallModel objectWithKeyValues:responseObj],error);
    }];
}

@end
