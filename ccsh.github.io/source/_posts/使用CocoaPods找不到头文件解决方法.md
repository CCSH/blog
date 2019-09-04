---
title: 使用CocoaPods找不到头文件解决方法

categories:
  - CocoaPods

tags:
  - 问题
  
comments: true
---

<!-- more -->
使用CocoaPods后,发现总是找不到头文件

在TARGETS -> Search Paths -> User Header Search Paths 中 写入 ${SRCROOT} 再将后面参数改为recursive