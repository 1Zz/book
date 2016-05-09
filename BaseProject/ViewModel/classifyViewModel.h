//
//  classifyViewModel.h
//  BaseProject
//
//  Created by ios－33 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ClassifyNetManager.h"

@interface classifyViewModel : BaseViewModel

- (instancetype)initWithGender : (NSString *)gender;
@property (nonatomic , strong) NSString *gender;

@property (nonatomic) NSInteger rowNumber;


@end
