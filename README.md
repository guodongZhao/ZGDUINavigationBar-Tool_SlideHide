# ZGDUINavigationBar-Tool_SlideHide

##tableView or collectionView 滑动时navigationBar显示和隐藏
===========================================================

### * 配置文件？ NO！ 你只需要简单的导入头文件即可
```objc
 #import "UINavigationBar+Tool_SlideHide_.h"
```
* `Demo` AND  `Use`

####  1.设置UINavigationBar
##### Remarks : 使用时在当前视图中计算相应的透明度 并设置navigationController.navigationBar自定义属性
```objc
/**
 *  @see               设置UINavigationBar
 *
 *  @param alpha       UINavigationBar的透明度
 *  @param customColor 自定义UINavigationBar颜色
 */
- (void)zgd_setBackgroundColorAlpha:(CGFloat)alpha
                withCustomViewColor:(UIColor *)customColor;

```

#### 2.还原操作 

  ##### Remarks : 当前视图离开时，使用还原操作取消UINavigationBar的属性操作
  ------------
```objc
/**
 *  @see               还原操作
 */
- (void)zgd_dealloc;
```
