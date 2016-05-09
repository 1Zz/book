//
//  resouresNetManager.m
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "resouresNetManager.h"

// ?view=summary&book=531169b3173bfacb4904ca67
#define resouresPath  @"http://api.zhuishushenqi.com/toc"

@implementation resouresNetManager

+ (id)getResouresBookID:(NSString *)ID completionHandle:(void (^)(id, NSError *))completionHandle {
    NSDictionary *dic = @{@"view":@"summary",
                          @"book":ID};
    return [self GET:resouresPath parameters:dic completionHandler:^(resourcesModel *responseObj, NSError *error) {
        completionHandle ([resourcesModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

@end
