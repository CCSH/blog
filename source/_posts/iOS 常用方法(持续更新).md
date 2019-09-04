---
title: iOS 常用方法(持续更新)
categories:
  - iOS
tags:
  - 随笔
comments: true
---


<!-- more -->
//管理APP所有权限
```
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
```
//tableview取消选中（点击方法中添加此方法）
```
[self performSelector:@selector(deselect) withObject:nil afterDelay:0.25f];
```
//取消选中
```
- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
}
```
//使用系统的复制粘贴功能
```
[UIPasteboard generalPasteboard].string = @"你的字符串";
```
//修改系统相册界面为中文
```
在 Info.plist 文件中添加 Localizations 键值 内容为item 值为Chinese (simplified)
```
//默认返回按钮去掉文字（此方法遇到特殊情况不好用，最好在界面跳转前重新定义backBarButtonItem）
```
[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
```
//禁止tableview滑动
```
self.tableview.scrollEnabled = NO;
```
//隐藏导航栏
```
[self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                           forBarPosition:UIBarPositionAny
                               barMetrics:UIBarMetricsDefault];
[self.navigationController.navigationBar setShadowImage:[UIImage new]];
```
//父视图透明子视图不透明
```
btn.backgroundColor = [[UIColor colorWithWhite:0.5 alpha:1] colorWithAlphaComponent:0.1];
```
//tableview改变头部视图背景颜色与字体颜色
```
#pragma mark 改变头部视图
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = ViewBGC;
    UITableViewHeaderFooterView *head = (UITableViewHeaderFooterView *)view;
    head.textLabel.textColor = RGB(62, 99, 114, 1);
}
#pragma mark 改变底部视图
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = [UIColor clearColor];
}
```
//开启照明
```
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    self.isOpen = !self.isOpen;
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        if (self.isOpen) {
            [device setTorchMode:AVCaptureTorchModeOn];
        } else {
            [device setTorchMode:AVCaptureTorchModeOff];
        }
        [device unlockForConfiguration];
    }
    
}
```
//UITableView 的 headerView跟随 cell一起滚动
```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        if (scrollView.contentOffset.y<=SectionHeaderHeight && scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= SectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-SectionHeaderHeight, 0, 0, 0);
        }
    }
}
```
获取APP的图标 icon
```
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];

    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];

    UIImage* image = [UIImage imageNamed:icon];

```