---
title: iOS 屏幕强制旋转 (模态、Push、导航栏、状态栏)
categories:
  - iOS
tags:
  - tableview
comments: true
---


<!-- more -->
[状态栏旋转详见](http://www.jianshu.com/p/f4218b16dd72)

###界面旋转准备
- 在AppDelegate.h中添加属性

```
//是否旋转
@property (nonatomic, assign) BOOL isRotation;
```
- 在AppDelegate.m中添加方法

```
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    if (self.isRotation) {
        //可以针对不同的界面创建不同的值，进行返回
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}
```
- 进入正题，找到需要旋转的界面

```
- (IBAction)btnClick:(id)sender {
    NSLog(@"旋转");
    //支持旋转
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.isRotation = YES;

    [self interfaceOrientation:UIInterfaceOrientationLandscapeLeft];
}

- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    //强制转换
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //关闭旋转(恢复原状)
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.isRotation = NO;
    
    [self interfaceOrientation:UIInterfaceOrientationPortrait];
}
```
>需要注意的是这个值可以在你真的需要旋转的时候进行赋值，比如在视频播放的时候全屏点击的时候进行处理

[另附上代码地址仅供参考](https://github.com/CCSH/SHInterfaceRotation)