//
//  RankNetManager.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankNetManager.h"

// start=0&limit=100
#define bookPath  @"http://api.zhuishushenqi.com/ranking/%@"

@implementation RankNetManager

+ (id)getBookID:(NSString *)ID start:(NSInteger)start completionHandle:(void (^)(id, NSError *))completionHandle {
    NSString *path = [NSString stringWithFormat:bookPath,ID];
    NSDictionary *dic = @{@"start":@(start),
                          @"limit":@100};
    return [self GET:path parameters:dic completionHandler:^(RankModel *responseObj, NSError *error) {
        completionHandle([RankModel objectWithKeyValues:responseObj],error);
    }];
}
@end
