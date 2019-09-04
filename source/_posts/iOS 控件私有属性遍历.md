---
title: iOS 控件私有属性遍历
categories:
  - iOS
tags:
  - 方法
comments: true
---


<!-- more -->
控件私有属性遍历主要利用OC的RunTime机制
首先加入头文件
```
#import <objc/runtime.h>
```
写入代码
```
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([NSClassFromString(@"UIView") class], &outCount);
    
    for (NSInteger i = 0; i < outCount; ++i) {
        // 遍历取出该类成员变量
        Ivar ivar = *(ivars + i);
        
        NSLog(@"\n name = %s  \n type = %s", ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
    
    // 根据内存管理原则释放指针
    free(ivars);
```
通过KVC进行修改
```
    //拿到私有的属性forKey: 进行改变setValue:
//    [self.view setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>];
```