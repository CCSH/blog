---
title: Xcode 常见错误(持续更新)
categories:
  - Xcode
tags:
  - 问题
comments: true
---


<!-- more -->
- 问题:Xcode的 Command +/ 快捷键注释代码，不可使用

```
解决：在终端输入sudo /usr/libexec/xpccachectl  然后重启电脑
```
- 问题:Xcode9 xib报错 Safe Area Layout Guide before iOS 9.0
```
1、打开右侧的 Show the File inspetcor

2、去掉 Use Safe Area Layout Guides
```
![去掉](http://upload-images.jianshu.io/upload_images/1897259-0ed6b579b9a5fc6b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)