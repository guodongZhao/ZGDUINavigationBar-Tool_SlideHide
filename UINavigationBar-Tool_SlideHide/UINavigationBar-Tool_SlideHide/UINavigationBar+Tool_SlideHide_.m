//
//  UINavigationBar+Tool_SlideHide_.m
//  -navbar滑动显示隐藏
//
//  Created by 赵国栋 on 16/4/19.
//  Copyright © 2016年 https://github.com/guodongZhao/ZGDUINavigationBar-Tool_SlideHide.git. All rights reserved.
//

/**
 * 改变UINavigationBar透明度方案
 * 1.改变setBackgroundImage:中UIImage的透明度
 * 2.向UINavigationBar中插入一个视图，通过改变视图的颜色透明度达到想要的效果
 */
#import "UINavigationBar+Tool_SlideHide_.h"
#import <objc/runtime.h>

#define kViewHeight [UIScreen mainScreen].bounds.size.height
#define kViewWidth [UIScreen mainScreen].bounds.size.width

@interface UINavigationBar ()

@property (nonatomic, strong) UIView *backView;

@end

@implementation UINavigationBar (Tool_SlideHide_)
static char backViewKey;

// 使用runtime机制关联对象
- (void)setBackView:(UIView *)backView
{
    objc_setAssociatedObject(self, &backViewKey, backView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)backView
{
    return objc_getAssociatedObject(self, &backViewKey);
}


/**
 *  设置UINavigationBar的透明度
 */
- (void)zgd_setBackgroundColorAlpha:(CGFloat)alpha
{
    if (!self.backView) {
        // 1.把背景设置为透明
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        // 2.取消底部的线条
        // 需要与setBackgroundImage:forBarMetrics:一起使用才可以
        [self setShadowImage:[UIImage new]];
        
        // 3.初始化视图
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, kViewWidth, 64)];
        // 取消view的第一响应链 相应navigationItem按钮
        self.backView.userInteractionEnabled = NO;
        // 适应屏幕
        self.backView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
        
        // 4.添加视图
        [self insertSubview:self.backView atIndex:0];
        
        
    }
    // 5.设置颜色的透明度
    self.backView.backgroundColor = [self.barTintColor colorWithAlphaComponent:alpha];
    
    // 6.设置titleView的透明度
    [self setValue:@(alpha) forKeyPath:@"titleView.alpha"];
}

/**
 *  使用结束，还原
 */
- (void)zgd_dealloc
{
    // 1.还原背景图片
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    // 2.还原底部阴影图片
    [self setShadowImage:nil];
    // 3.移除backView
    [self.backView removeFromSuperview];
    // 4.销毁backView关联
    objc_removeAssociatedObjects(self);
}


@end
