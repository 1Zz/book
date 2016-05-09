//
//  SubClassModel.m
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SubClassModel.h"

@implementation SubClassModel


+ (NSDictionary *)objectClassInArray{
    return @{@"books" : [subBooksModel class]};
}
@end
@implementation subBooksModel

@end


