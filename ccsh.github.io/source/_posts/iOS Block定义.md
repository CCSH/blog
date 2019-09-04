---
title: iOS Block定义
categories:
  - iOS
tags:
  - 随笔
comments: true
---


Block定义
<!-- more -->
```
//直接定义
@property (nonatomic, copy) void(^block)(NSInteger);
```
```
//方法中定义
block:(void(^) (NSInteger index))block;
```
```
//其他定义
typedef void(^Block)(NSInteger index);

@property (nonatomic, copy) Block block;
```