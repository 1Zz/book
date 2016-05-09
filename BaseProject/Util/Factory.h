//
//  Factory.h
//  BaseProject
//
//  Created by ios－33 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/** 向某个控制器上，添加菜单按钮 */
+ (void)addMenuItemToVC : (UIViewController *)vc;
+ (void)addRigthItemToVC : (UIViewController *)vc;
+ (void)addLeftItemToVC : (UIViewController *)vc;
@end
