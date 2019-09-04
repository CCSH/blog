---
title: iOS 启动图全屏（状态栏隐藏）
categories:
  - iOS
tags:
  - 方法
comments: true
---


<!-- more -->
在Info.plist中增加一个配置即可：Status bar is initially hidden    为YES

这里的YES表示在app初始化(启动)的时候就隐藏状态栏。

当然，在Default.png显示完毕后状态栏还是隐藏的。如果想重新显示状态栏，补上下面代码即可：
```
[UIApplication sharedApplication].statusBarHidden = NO;
```