//
//  RankModel.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankModel.h"

@implementation RankModel

@end
@implementation RankingModel

+ (NSDictionary *)objectClassInArray{
    return @{@"books" : [BooksModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"aNew":@"new"};
}

@end


@implementation BooksModel

@end


