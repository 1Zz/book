//
//  SubClassNetManager.m
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SubClassNetManager.h"

//   http://api.zhuishushenqi.com/book/by-tag?tag=玄幻&start=0&limit=50
#define subClassPath  @"http://api.zhuishushenqi.com/book/by-tag"


@implementation SubClassNetManager

+ (id)getSubClassWithTag:(NSString *)tag start:(NSInteger)start completionHandle:(void (^)(id, NSError *))completionHandle {
    NSDictionary *dic = @{@"tag":tag,
                          @"start":@(start),
                          @"limit":@"50"};
    return [self GET:subClassPath parameters:dic completionHandler:^(SubClassModel *responseObj, NSError *error) {
        completionHandle ([SubClassModel objectWithKeyValues:responseObj],error);
    }];
}

@end
