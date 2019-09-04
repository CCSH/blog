---
title: iOS 各种返回上一界面
categories:
  - iOS
tags:
  - 随笔
comments: true
---


各种返回上一界面
<!-- more -->
返回上一界面
```
[self.navigationController popViewControllerAnimated:<#(BOOL)#>];
```
返回跟视图
```
[self.navigationController popToRootViewControllerAnimated:<#(BOOL)#>];
```
返回指定界面（两种）
```
#pragma mark 第一种
[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex: 1] animated:YES];
#pragma mark 第二种
for (UIViewController *controller in self.navigationController.viewControllers) {
    if ([controller isKindOfClass:[你要跳转到的Controller class]]) {
        [self.navigationController popToViewController:controller animated:YES];
    }
}
```