---
title: iOS 内存泄漏问题
categories:
  - iOS
tags:
  - 随笔
comments: true
---


<!-- more -->
User-facing text should use localized string macro

![修改为NO](http://upload-images.jianshu.io/upload_images/1897259-4f662f75e499001a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Value stored to 'XXX' is never read 
这个变量发现只是被赋值并没有被使用
```
实例化 XXX = nil;
XXX = 。。。。
```