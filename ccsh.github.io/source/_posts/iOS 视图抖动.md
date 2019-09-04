---
title: iOS 视图抖动
categories:
  - iOS
tags:
  - 方法
comments: true
---


iOS 视图抖动
<!-- more -->
.h
```
/**
 添加抖动动画
 
 @param view 添加的视图
 */
+ (void)addAnimationShakeWithView:(UIView *)view;

/**
 移除抖动动画

 @param view 移除的视图
 */
+ (void)removeAnimationShakeWithView:(UIView *)view;
```
.m
```
#define kShakingRadian(R) ((R) / 180.0 * M_PI)

@implementation SHAnimation

#pragma mark - 添加抖动动画
+ (void)addAnimationShakeWithView:(UIView *)view{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"transform.rotation";
    
    animation.values = @[@(kShakingRadian(-5)),  @(kShakingRadian(5)), @(kShakingRadian(-5))];
    
    animation.duration = 0.25;
    
    // 动画的重复执行次数
    animation.repeatCount = MAXFLOAT;
    
    // 保持动画执行完毕后的状态
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    [view.layer addAnimation:animation forKey:@"sh_animation_shake"];
}

#pragma mark - 移除抖动动画
+ (void)removeAnimationShakeWithView:(UIView *)view{
    
    //结束动画
    [view.layer removeAnimationForKey:@"sh_animation_shake"];
}
```