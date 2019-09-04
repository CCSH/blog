---
title: iOS 键盘监听处理遮挡控件问题
categories:
  - iOS
tags:
  - 
comments: true
---


键盘监听处理遮挡控件问题
<!-- more -->
```
#pragma mark - 键盘处理
#pragma mark 监听系统发出的键盘通知
- (void)addKeyboardNote {

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    // 1.显示键盘
    [center addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillShowNotification object:nil];
    
    // 2.隐藏键盘
    [center addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillHideNotification object:nil];
}
```
 - 处理方法

```
- (void)keyboardChange:(NSNotification *)note {
    
    NSDictionary *userInfo = note.userInfo;
    NSTimeInterval duration;
    CGRect keyboardF;
    
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&duration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardF];
    
    if (duration <= 0.0) {
        duration = 0.25;
    }
    
    //取得当前聚焦文本框最下面的Y值
    UITextField *field = [self.view viewWithTag:1];
    CGFloat maxY = CGRectGetMaxY(field.frame) + 5;
    
    [UIView animateWithDuration:duration animations:^{
        if (maxY >  CGRectGetMidY(keyboardF)) { //挡住了
            self.view.transform = CGAffineTransformMakeTranslation(0, - (maxY - CGRectGetMidY(keyboardF) ));
        } else { // 没有挡住
            self.view.transform = CGAffineTransformIdentity;
        }
    }];
}
```
- 销毁处理

```
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
```