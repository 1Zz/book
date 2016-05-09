//
//  SubBookWallViewController.h
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubBookWallViewController : UIViewController
- (instancetype)initWithBookID : (NSString *)ID;
@property (nonatomic , strong) NSString *ID;

@property (nonatomic , strong) NSString *shortIntro;

@end
