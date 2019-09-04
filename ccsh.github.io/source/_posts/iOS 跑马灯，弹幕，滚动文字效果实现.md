---
title: iOS 跑马灯，弹幕，滚动文字效果实现
categories:
  - iOS
tags:
  - 方法
comments: true
---


跑马灯，弹幕，滚动文字效果实现
<!-- more -->
跟视图设置
```
self.backVIew.clipsToBounds = YES;
```
建立定时器
```
[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(labelRoll) userInfo:nil repeats:YES];
```
跑起来
```
- (void) labelRoll

{
  
  CGPoint labelCenter = self.label.center;

  // 当控件的x坐标已经超过了视图的宽度

  if(labelCenter.x  <  self.backVIew.frame.origin.x-self.label.frame.size.width){

  // 控制控件自视图右侧开始移动

  self.customLab.center = CGPointMake(self.backVIew.frame.size.width+self.label.frame.size.width/2, labelCenter.y);

  }else{

  // 控制控件移动中(微调)

  self.label.customLab.center = CGPointMake(labelCenter.x-5, labelCenter.y);
  }

}
```