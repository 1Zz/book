//
//  SubClassViewModel.m
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SubClassViewModel.h"

@implementation SubClassViewModel

- (instancetype)initWithTag:(NSString *)tag {
    if (self = [super init]) {
        _tag = tag;
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    
    self.dataTask = [SubClassNetManager getSubClassWithTag:_tag start:_start completionHandle:^(SubClassModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.books];
        completionHandle (error);
    }];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle {
    _start += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle {
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}



- (NSInteger)rowNumber {
    return self.dataArr.count;
}
- (subBooksModel *)subClassDataForRow : (NSInteger)row {
    return self.dataArr[row];
}
- (NSURL *)coverForRow : (NSInteger)row {
    NSString *strURL = [self subClassDataForRow:row].cover;
    NSString *imageStr = [strURL substringFromIndex:7];
    return [NSURL URLWithString:imageStr];
}  //  图片
- (NSString *)authorFOrRow : (NSInteger)row {
    return [self subClassDataForRow:row].author;
}  // 作者
- (NSString *)titleForRow : (NSInteger)row {
    return [self subClassDataForRow:row].title;
} // 书名
- (NSString *)shortIntroForRow : (NSInteger)row {
    return [self subClassDataForRow:row].shortIntro;
}  // 简介
- (NSString *)lastChapterForRow : (NSInteger)row {
    return [self subClassDataForRow:row].lastChapter;
}  // 最新章节
- (NSString *)IDForRow:(NSInteger)row {
    return [self subClassDataForRow:row]._id;
}

@end
