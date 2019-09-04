---
title: iOS 常用控件之UIViewAutoresizing(自动适配)
categories:
  - iOS
tags:
  - 知识
comments: true
---


<!-- more -->
UIViewAutoresizing是一个枚举类型，默认是UIViewAutoresizingNone，也就是不做任何处理。

---
属性名|说明
-|-
UIViewAutoresizingNone|不会随父视图的改变而改变
UIViewAutoresizingFlexibleLeftMargin|自动调整view与父视图左边距，以保证右边距不变
UIViewAutoresizingFlexibleWidth|自动调整view的宽度，保证左边距和右边距不变
UIViewAutoresizingFlexibleRightMargin|自动调整view与父视图右边距，以保证左边距不变
UIViewAutoresizingFlexibleTopMargin|自动调整view与父视图上边距，以保证下边距不变
UIViewAutoresizingFlexibleHeight|自动调整view的高度，以保证上边距和下边距不变
UIViewAutoresizingFlexibleBottomMargin|自动调整view与父视图的下边距，以保证上边距不变

特别说明:
例如：如果想要调整视图的宽高来达到上下左右距离不变，可以使用如下方法，其他情况类似
```
view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
```
