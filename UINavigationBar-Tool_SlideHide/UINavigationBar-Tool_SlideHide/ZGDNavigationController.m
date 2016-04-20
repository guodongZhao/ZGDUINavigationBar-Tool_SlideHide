//
//  ZGDNavigationController.m
//  -navbar滑动显示隐藏
//
//  Created by 赵国栋 on 16/4/19.
//  Copyright © 2016年 https://github.com/guodongZhao/ZGDUINavigationBar-Tool_SlideHide.git. All rights reserved.
//

#import "ZGDNavigationController.h"



@implementation ZGDNavigationController

+ (void)initialize
{
    // 设置UINavigationBar的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1]];
    // 设置navItem颜色
    [[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    // 设置title颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) {
        
        // 隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
