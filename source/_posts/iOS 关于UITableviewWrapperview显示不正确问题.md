---
title: iOS 关于UITableviewWrapperview显示不正确问题
categories:
  - iOS
tags:
  - 问题
---


问题：就算是设置了`automaticallyAdjustsScrollViewInsets = NO` 或者 `contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;` 不起作用 查看显示`UITableviewWrapperview` 与 `UITableView` 位置不一致

```
//添加一个UIScrollView到最下层，让UIViewController去自动适配你添加的这个
if (!self.sh_scroll) {
    self.sh_scroll = [[UIScrollView alloc]init];
    [self.view addSubview:self.sh_scroll];
}
[self.view sendSubviewToBack:self.sh_scroll];
```
