---
title: iOS tableview footerview、headerview悬浮处理
categories:
  - iOS
tags:
  - 方法
---


悬浮处理
<!-- more -->
```
//去掉UItableview的section的headerview悬浮
CGFloat sectionHeaderH = 10;
if (scrollView.contentOffset.y<=sectionHeaderH && scrollView.contentOffset.y>=0) {
    scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
} else if (scrollView.contentOffset.y>=sectionHeaderH) {
    scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderH, 0, 0, 0);
}else{
    scrollView.contentInset = UIEdgeInsetsZero;
}
```

```
//去掉UItableview的section的footerview悬浮
CGFloat sectionFooterH = 10;
if (scrollView.contentOffset.y<=sectionFooterH && scrollView.contentOffset.y>=0) {
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionFooterH, 0);
} else if (scrollView.contentOffset.y>= sectionFooterH) {
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionFooterH, 0);
}else{
    scrollView.contentInset = UIEdgeInsetsZero;
}
```

同时使用或者其他地方涉及到 contentInset 修改时记得处理

> 其实不管是头部悬浮还是底部悬浮都是修改 _contentInset_ 它其实还是悬浮只是在界面中看不到了
