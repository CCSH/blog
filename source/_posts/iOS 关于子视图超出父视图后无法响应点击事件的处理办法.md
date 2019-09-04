---
title: iOS 关于子视图超出父视图后无法响应点击事件的处理办法
categories:
  - iOS
tags:
  - 问题
comments: true
---


关于子视图超出父视图后无法响应点击事件的处理办法
<!-- more -->
```
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    for (UIView *view in self.subviews) {

        CGPoint viewP = [self convertPoint:point toView:view];
        
        if ([view pointInside:viewP withEvent:event]) {
            return view;
        }
    }
    return [super hitTest:point withEvent:event];
}
```
其中Btn就是在self上超出的控件