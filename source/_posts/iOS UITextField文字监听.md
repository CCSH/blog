---
title: iOS UITextField文字监听
categories:
  - iOS
tags:
  - 方法
comments: true
---


UITextField文字监听
<!-- more -->
```
//添加监听
[self.textFiled addTarget:self action:@selector(textFieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
```
```
//监听改变方法
- (void)textFieldTextDidChange:(UITextField *)textChange{
    NSLog(@"文字改变：%@",textChange.text);
}
```