//
//  ZGDFirstViewController.m
//  -navbar滑动显示隐藏
//
//  Created by 赵国栋 on 16/4/19.
//  Copyright © 2016年 https://github.com/guodongZhao/ZGDUINavigationBar-Tool_SlideHide.git. All rights reserved.
//

#import "ZGDFirstViewController.h"
#import "UINavigationBar+Tool_SlideHide_.h"

// 开始显示和隐藏的临界点
static CGFloat NAVBAR_CHANGE_POINT = 60;

@interface ZGDFirstViewController () <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZGDFirstViewController

#pragma mark -
#pragma mark lifecycle
// 视图将要加载时设置tableView代理
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
}
// 视图将要离开时
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 1.设置tableView的代理为nil
    self.tableView.delegate = nil;
    // 2.还原
    [self.navigationController.navigationBar zgd_dealloc];
}

#pragma mark -
#pragma mark UITableViewDataSource
// 设置tableView 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

// 设置每行内容  cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    //  1.从重用对象池中找不用的cell对象
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    //  2.如果没有找到就自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //  3.设置cell的属性
    cell.textLabel.text = [NSString stringWithFormat:@"第%zi行", indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.获取偏移值
    CGFloat contentY = scrollView.contentOffset.y;
    
    if (contentY > NAVBAR_CHANGE_POINT) {
        // 2.计算透明度
        CGFloat alpha = 1 - (NAVBAR_CHANGE_POINT + 64 - contentY) / 64.0;
        // 3.设置navbar的透明度
        [self.navigationController.navigationBar zgd_setBackgroundColorAlpha:alpha withCustomViewColor:[UIColor blueColor]];
    }else
    {
        // 4.隐藏navBar
        [self.navigationController.navigationBar zgd_setBackgroundColorAlpha:0 withCustomViewColor:[UIColor blueColor]];
    }
    
}

@end
