---
title: iOS 屏幕旋转之后状态栏显示问题
categories:
  - iOS
tags:
  - 
comments: true
---


<!-- more -->
[屏幕强制旋转详见](http://www.jianshu.com/p/07641385799d)

在Info.plist 添加

键值：View controller-based status bar appearance

参数：NO

```

//在AppDelegate

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions添加如下代码


[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];

```