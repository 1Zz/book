//
//  BookViewModel.m
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BookViewModel.h"

@implementation BookViewModel


- (instancetype)initWithID:(NSString *)ID {
    if (self = [super init]) {
        _ID = ID;
    }
    return self;
}

- (NSInteger)rowNumber {
    return self.dataArr.count;
}

- (BooksModel *)booksDataForRow : (NSInteger)row {
    return self.dataArr[row];
}
- (NSURL *)coverURLForRow : (NSInteger)row {
    NSString *strURL = [self booksDataForRow:row].cover;
    NSString *imageStr = [strURL substringFromIndex:7];
    return [NSURL URLWithString:imageStr];
}
- (NSString *)titleForRow : (NSInteger)row {
    return [self booksDataForRow:row].title;
}
- (NSString *)authorForRow : (NSInteger)row {
    return [self booksDataForRow:row].author;
}
- (NSString *)shortIntroForRow : (NSInteger)row {
    return [self booksDataForRow:row].shortIntro;
}
- (NSString *)subBooksForRow:(NSInteger)row {
    return [self booksDataForRow:row]._id;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [RankNetManager getBookID:_ID start:_start completionHandle:^(RankModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.ranking.books];
        completionHandle (error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle {
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle {
    _start += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}




@end
