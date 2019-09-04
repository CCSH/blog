---
title: iOS 常用控件之CAAnimation
categories:
  - iOS
tags:
  - 知识
comments: true
---


<!-- more -->
属性 | 说明
---|---
duration | 动画的时长
repeatCount | 重复的次数。不停重复设置为 HUGE_VALF（一般不与一般不与repeatDuration同时使用同时使用）
repeatDuration | 设置动画的时间。在该时间内动画一直执行，不计次数。（一般不与一般不与repeatCount同时使用同时使用）
beginTime | 指定动画开始的时间。从开始延迟几秒的话，设置为【CACurrentMediaTime() + 秒数】 的方式
timingFunction | 设置动画的速度变化
autoreverses | 动画结束时是否执行逆动画
fromValue | 所改变属性的起始值
toValue | 所改变属性的结束时的值
byValue | 所改变属性相同起始值的改变量
###keyPath的值
```
//    transform.scale = 比例转换(x.y不写就是中心点)
//    transform.rotation = 旋转(x.y.z不写就是中心点)
//    opacity = 透明度
//    margin = 边距
//    position ＝ 位移
//    backgroundColor = 背景颜色
//    cornerRadius = 圆角
//    borderWidth ＝ 边框宽度
//    bounds ＝ 位置，体积
//    contents ＝ 内容
//    contentsRect ＝ 面积
//    frame ＝ 位置，体积
//    hidden ＝ 是否隐藏
//    mask ＝ 任务
//    masksToBounds
//    shadowColor ＝ 阴影颜色
//    shadowOffset ＝ 阴影偏移
//    shadowOpacity ＝ 阴影透明
//    shadowRadius ＝ 阴影半径
```
####部分keyPath对应形式
说明 | 使用形式
---|---
transform.scale 比例转化 | @(0~1)
transform.scale.x 宽的比例 | @(0~1)
transform.scale.y  高的比例 | @(0~1)
transform.rotation 围绕中心点旋转 | @(0~2*M_PI)
transform.rotation.x 围绕x轴旋转 | @(0~2*M_PI)
transform.rotation.y 围绕y轴旋转 | @(0~2*M_PI)
transform.rotation.z 围绕z轴旋转 | @(0~2*M_PI)
cornerRadius 圆角的设置 | @(X)
backgroundColor 背景颜色的变化 | (id)[UIColor xxxColor].CGColor
bounds 大小中心不变 | [NSValue valueWithCGRect:CGRectMake(X, Y, W, H)];
position 位置(中心点的改变) | [NSValue valueWithCGPoint:CGPointMake(X, Y)];
contents 内容 | 比如UIImageView的图片imageView.toValue = (id)[UIImage imageNamed:@"xxx.png"].CGImage;
opacity 透明度 | @(0~1)
contentsRect.size.width 横向拉伸缩放 | @(0~1)

具体使用
```
//圆角
    CABasicAnimation *animation1 = [[CABasicAnimation alloc]init];
    //动画效果
    animation1.keyPath = @"cornerRadius";
    //动画执行周期
    animation1.duration = 1;
    //进行改变
    animation1.toValue = @(self.btn.frame.size.height/2);
    //保持动画结束之后的状态
    animation1.fillMode = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    
    //位置(向上平移100)
    CABasicAnimation *animation2 = [[CABasicAnimation alloc]init];
    //动画效果
    animation2.keyPath = @"position";
    //动画执行周期
    animation2.duration = 1;
    //开始时间
    animation2.beginTime = animation1.beginTime + animation1.duration;
    //进行改变
    animation2.toValue = [NSValue valueWithCGPoint:CGPointMake(self.btn.center.x, self.btn.center.y - 100)];
    //保持动画结束之后的状态
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    //翻转(X轴)
    CABasicAnimation *animation3 = [[CABasicAnimation alloc]init];
    //动画效果
    animation3.keyPath = @"transform.rotation.x";
    //动画执行周期
    animation3.duration = 1;
    //开始时间
    animation3.beginTime = animation2.beginTime;
    //进行改变
    animation3.toValue = @(2*M_PI);
    //保持动画结束之后的状态
    animation3.fillMode = kCAFillModeForwards;
    animation3.removedOnCompletion = NO;
    
    //bounds(等高)
    CABasicAnimation *animation4 = [[CABasicAnimation alloc]init];
    //动画效果
    animation4.keyPath = @"bounds";
    //动画执行周期
    animation4.duration = 1;
    //开始时间
    animation4.beginTime = animation3.beginTime + animation3.duration;
    //进行改变
    animation4.toValue = [NSValue valueWithCGRect:CGRectMake(self.btn.frame.origin.x + (self.btn.frame.size.width - self.btn.frame.size.height)/2, self.btn.frame.origin.y, self.btn.frame.size.height, self.btn.frame.size.height)];
    //保持动画结束之后的状态
    animation4.fillMode = kCAFillModeForwards;
    animation4.removedOnCompletion = NO;
    
    //旋转
    CABasicAnimation *animation5 = [[CABasicAnimation alloc]init];
    //动画效果
    animation5.keyPath = @"transform.rotation";
    //动画执行周期
    animation5.duration = 1;
    //开始时间
    animation5.beginTime = animation4.beginTime;
    //进行改变
    animation5.toValue = @(2*M_PI);
    //保持动画结束之后的状态
    animation5.fillMode = kCAFillModeForwards;
    animation5.removedOnCompletion = NO;
    
    //淡入淡出
    CABasicAnimation *animation6 = [[CABasicAnimation alloc]init];
    //动画效果
    animation6.keyPath = @"opacity";
    //动画执行周期
    animation6.duration = 1;
    //开始时间
    animation6.beginTime = animation5.beginTime + animation5.duration;
    //进行改变
    animation6.fromValue = @0;
    animation6.toValue = @1;
    //保持动画结束之后的状态
    animation6.fillMode = kCAFillModeForwards;
    animation6.removedOnCompletion = NO;
    
    //背景颜色
    CABasicAnimation *animation7 = [[CABasicAnimation alloc]init];
    //动画效果
    animation7.keyPath = @"backgroundColor";
    //动画执行周期
    animation7.duration = 1;
    //开始时间
    animation7.beginTime = animation6.beginTime + animation6.duration;
    //进行改变
    animation7.toValue = (id)[UIColor greenColor].CGColor;
    //保持动画结束之后的状态
    animation7.fillMode = kCAFillModeForwards;
    animation7.removedOnCompletion = NO;
    
    //创建动画组
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc]init];
    //动画执行周期
    animationGroup.duration = animation7.beginTime + animation7.duration;
    //添加动画到动画组
    animationGroup.animations = @[animation1,animation2,animation3,animation4,animation5,animation6,animation7];
    //保持动画结束之后的状态
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    
    //视图添加动画
    [self.btn.layer addAnimation:animationGroup forKey:@"animation"];
```

###效果
![效果](http://upload-images.jianshu.io/upload_images/1897259-5814460310038a17.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[代码地址](https://github.com/CCSH/SHAnimation)



