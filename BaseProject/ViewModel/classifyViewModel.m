//
//  classifyViewModel.m
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "classifyViewModel.h"

@implementation classifyViewModel

- (instancetype)initWithGender:(NSString *)gender {
    if (self = [super init]) {
        _gender = gender;
    }
    return self;
}

- (NSInteger)rowNumber {
    return self.dataArr.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [ClassifyNetManager getClassifyWithGender:self.gender completionHandle:^(ManClassModel *model, NSError *error) {
        
        [self.dataArr removeAllObjects];
        
        [self.dataArr addObjectsFromArray:model.tags];
        completionHandle (error);
    }];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle {
    [self getDataFromNetCompleteHandle:completionHandle];
}


@end
