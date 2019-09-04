---
title: iOS 常用宏定义
categories:
  - 随笔
tags:
  - 宏
comments: true
---


iOS 常用宏定义
<!-- more -->
```
#pragma mark - 方法定义
#pragma mark 颜色
#define kRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#pragma mark 描边
#define kSHViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setCornerRadius:(Radius)];\
[View.layer setBorderColor:[Color CGColor]]

#pragma mark - 其他定义
//设备物理宽高
#define kSHHeight ([UIScreen mainScreen].bounds.size.height)
#define kSHWidth ([UIScreen mainScreen].bounds.size.width)

//界面宽高
#define kSHViewWidth (self.view.frame.size.width)
#define kSHViewHeight (self.view.frame.size.height)

//状态栏高度
#define kStatusBarH ([[UIApplication sharedApplication] statusBarFrame].size.height)

//是否为V以上系统
#define IOS(V) [[[UIDevice currentDevice] systemVersion] floatValue] >= V

// 系统delegate
#define kSHAppDelegate (AppDelegate *)[UIApplication sharedApplication].delegate

//计算耗时
#define TICK        CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define TOCKFor(A)  SHLog(@"耗时计算-%@: %f",(A),CFAbsoluteTimeGetCurrent() - start);
#define TOCK        SHLog(@"耗时计算: %f",CFAbsoluteTimeGetCurrent() - start);

#pragma mark - 文件路径
//Document目录
#define DocumentPatch [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

//Caches目录
#define CachesPatch NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]

//Temp目录
#define TempPatch NSTemporaryDirectory()

#pragma mark - NSUserDefaults使用的键值

#define kSHUserDefaults [NSUserDefaults standardUserDefaults]

//清除模型中的所有数据
#define kSHClearModelData(Model) \
\
Model *_model##Model = [[Model alloc] init];\
u_int count##Model;\
objc_property_t *properties##Model = class_copyPropertyList([Model class], &count##Model);\
for (int i = 0; i< count##Model; i++){\
    [_model##Model setValue:nil forKey:[NSString stringWithFormat:@"%s",property_getName(properties##Model[i])]];\
}\
free(properties##Model);\

#pragma mark 适配(pt)
//4S:320*480
//5:320*568
//6:375*667
//6P:414*736
//X:375*812
#define kSHGetW(W) ((W)*([UIScreen mainScreen].bounds.size.width)/375)
#define kSHGetH(H) ((H)*([UIScreen mainScreen].bounds.size.height)/667)

// weak & strong
#define kSHWeak(VAR) \
@try {} @finally {} \
__weak __typeof__(VAR) weak_##VAR = (VAR);

#define kSHStrong(VAR) \
@try {} @finally {} \
__strong __typeof__(VAR) VAR = weak_##VAR
```