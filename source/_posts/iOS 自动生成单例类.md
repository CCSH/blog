---
title: iOS 自动生成单例类
categories:
  - iOS
tags:
  - 方法
comments: true
---


自动生成单例类
<!-- more -->
创建一个头文件写入
```
// .h
#define singleton_interface(class) + (instancetype)shared##class;

// .m
#define singleton_implementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
\
    return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
    if (_instance == nil) { \
        _instance = [[class alloc] init]; \
    } \
\
    return _instance; \
}
```
使用
```
.h
singleton_interface(ABC);
.m
singleton_implementation(ABC)
```