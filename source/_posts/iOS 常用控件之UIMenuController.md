---
title: iOS 常用控件之UIMenuController
categories:
  - iOS
tags:
  - 知识
comments: true
---


<!-- more -->
- 初始化UIMenuItem

```
    UIMenuItem *one = [[UIMenuItem alloc] initWithTitle:@"复制"action:@selector(menuOne:)];
    UIMenuItem *two = [[UIMenuItem alloc] initWithTitle:@"删除"action:@selector(menuTwo:)];
    UIMenuItem *three = [[UIMenuItem alloc] initWithTitle:@"转发"action:@selector(menuThree:)];
```
- 初始化UIMenuController

```
    UIMenuController *menu = [UIMenuController sharedMenuController];
    //菜单箭头方向
    menu.arrowDirection = UIMenuControllerArrowDefault;
    //添加Item内容
    [menu setMenuItems:[NSArray arrayWithObjects:one, two, three, nil]];
    //设置位置与添加视图(可以给cell的frame)
    [menu setTargetRect:CGRectMake(100, 100, 100, 20) inView:self.view];
    //显示菜单MenuVisible:并且带动画animated:
    [menu setMenuVisible:YES animated:YES];
```
- 还有最关键的一点添加此方法

```
- (BOOL)canBecomeFirstResponder
{    
    return YES;   
}
```
- 实现方法

```
- (void)menuOne:(id)sender{
    NSLog(@"复制");
}
- (void)menuTwo:(id)sender{
    NSLog(@"删除");
}
- (void)menuThree:(id)sender{
    NSLog(@"转发");
}
```
- 完整代码

```
//定义一个开关isOpen
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //返回与当前接收者有关的所有的触摸对象
    NSSet *allTouches = [event allTouches];
    //视图中的所有对象
    UITouch *touch = [allTouches anyObject];
    //返回触摸点在视图中的当前坐标
    CGPoint point = [touch locationInView:[touch view]];

    UIMenuItem *one = [[UIMenuItem alloc] initWithTitle:@"复制"action:@selector(menuOne:)];
    UIMenuItem *two = [[UIMenuItem alloc] initWithTitle:@"删除"action:@selector(menuTwo:)];
    UIMenuItem *three = [[UIMenuItem alloc] initWithTitle:@"转发"action:@selector(menuThree:)];

    UIMenuController *menu = [UIMenuController sharedMenuController];
    //菜单箭头方向(默认会自动判定)
    menu.arrowDirection = UIMenuControllerArrowDefault;
    //添加内容
    [menu setMenuItems:[NSArray arrayWithObjects:one, two, three, nil]];
    //设置位置
    [menu setTargetRect:CGRectMake(point.x, point.y, 0, 0) inView:self.view];
    //显示菜单并且带动画
    [menu setMenuVisible:!isOpen animated:YES];
    isOpen = !isOpen;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)menuOne:(id)sender{
    NSLog(@"复制");
}
- (void)menuTwo:(id)sender{
    NSLog(@"删除");
}
- (void)menuThree:(id)sender{
    NSLog(@"转发");
}
```
预览效果
![4B648165-B8A7-4BB0-A018-312CD202D45D.png](http://upload-images.jianshu.io/upload_images/1897259-abbede710e07a378.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)