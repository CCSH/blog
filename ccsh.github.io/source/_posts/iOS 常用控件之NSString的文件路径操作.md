---
title: iOS 常用控件之NSString的文件路径操作
categories:
  - iOS
tags:
  - 知识
comments: true
---


<!-- more -->
- 字符串

```
NSString *path = @"123/qwert/csh.txt";
```
- 获取文件名（带格式）

```
path.lastPathComponent
输出：csh.txt
```
- 获取文件路径（不带文件）

```
path.stringByDeletingLastPathComponent
输出：123/qwert
```
- 获取文件路径(带文件不带类型)

```
path.stringByDeletingPathExtension
输出：123/qwert/csh
```
- 获取文件类型

```
path.pathExtension
输出：txt
```