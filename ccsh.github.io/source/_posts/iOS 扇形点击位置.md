---
title: iOS 扇形点击位置
categories:
  - iOS
tags:
  - 方法
comments: true
---


扇形点击位置
<!-- more -->
```
float distance;//距离

float rads;//弧度

CGPoint point = [tap locationInView:self.view];

NSLog(@"。。。触点的位置%@",NSStringFromCGPoint(point));

CGPoint centerPoint = CGPointMake(WIDTH/2, (HEIGHT/2-30)/2);

NSLog(@"。。。中心点的坐标%@",NSStringFromCGPoint(centerPoint));

CGPoint startPoint = CGPointMake(WIDTH/2, HEIGHT/4-100);

distance = [self distanceFromPointX:point distanceToPointY:centerPoint];

rads = [self radiansToDegreesFromPointX:point ToPointY:startPoint ToCenter:centerPoint];
```
```
#pragma mark - 计算触点和中心点的弧度

-(float)radiansToDegreesFromPointX:(CGPoint)start ToPointY:(CGPoint)end ToCenter:(CGPoint)center{

  float rads;

  CGFloat a = (end.x - center.x);

  CGFloat b = (end.y - center.y);

  CGFloat c = (start.x- center.x);

  CGFloat d = (start.y- center.y);

  rads = acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));

  if (start.x < center.x) {

  rads = 2*M_PI - rads;

  }
  
  return rads;

}
```
```
#pragma mark - 计算触点到中心点的距离

-(float)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end{

  float distance;

  CGFloat xDist = (end.x - start.x);

  CGFloat yDist = (end.y - start.y);

  distance = sqrt((xDist * xDist) + (yDist * yDist));

  return distance;

}
```