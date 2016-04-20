//
//  UINavigationBar+Tool_SlideHide_.h
//  -navbar滑动显示隐藏
//
//  Created by 赵国栋 on 16/4/19.
//  Copyright © 2016年 https://github.com/guodongZhao/ZGDUINavigationBar-Tool_SlideHide.git. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Tool_SlideHide_)

/**
 *  @see               设置UINavigationBar
 *
 *  @param alpha       UINavigationBar的透明度
 *  @param customColor 自定义UINavigationBar颜色
 */
- (void)zgd_setBackgroundColorAlpha:(CGFloat)alpha withCustomViewColor:(UIColor *)customColor;

/**
 *  @see               还原操作
 */
- (void)zgd_dealloc;

@end
