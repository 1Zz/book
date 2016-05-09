//
//  ClassifyNetManager.m
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ClassifyNetManager.h"

// http://api.zhuishushenqi.com/tag?gender=male
#define classPath  @"http://api.zhuishushenqi.com/tag"

@implementation ClassifyNetManager

+ (id)getClassifyWithGender:(NSString *)gender completionHandle:(void (^)(id, NSError *))completionHandle {
    NSDictionary *dic = @{@"gender":gender};
    return [self GET:classPath parameters:dic completionHandler:^(ManClassModel *responseObj, NSError *error) {
        completionHandle ([ManClassModel objectWithKeyValues:responseObj],error);
    }];
}


@end
