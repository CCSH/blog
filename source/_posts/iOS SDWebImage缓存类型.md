---
title: iOS SDWebImage缓存类型
categories:
  - iOS
tags:
  - 随笔
comments: true
---


SDWebImage缓存类型
<!-- more -->
```
1. sd_setImageWithURL：

//图片缓存的基本代码，就是这么简单

[self.image1 sd_setImageWithURL:imagePath1];

2. sd_setImageWithURL:  completed:

//用block 可以在图片加载完成之后做些事情

[self.image2 sd_setImageWithURL:imagePath2 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

NSLog(@"这里可以在图片加载完成之后做些事情");

}];

3. sd_setImageWithURL:  placeholderImage:

//给一张默认图片，先使用默认图片，当图片加载完成后再替换

[self.image1 sd_setImageWithURL:imagePath1 placeholderImage:[UIImage imageNamed:@"default"]];

4. sd_setImageWithURL:  placeholderImage:  completed:

//使用默认图片，而且用block 在完成后做一些事情

[self.image1 sd_setImageWithURL:imagePath1 placeholderImage:[UIImage imageNamed:@"default"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

NSLog(@"图片加载完成后做的事情");

}];

5. sd_setImageWithURL:  placeholderImage:  options:

//options 选择方式

[self.image1 sd_setImageWithURL:imagePath1 placeholderImage:[UIImage imageNamed:@"default"] options:SDWebImageRetryFailed];

一、options所有选项：

//失败后重试

SDWebImageRetryFailed = 1 << 0,

//UI交互期间开始下载，导致延迟下载比如UIScrollView减速。

SDWebImageLowPriority = 1 << 1,

//只进行内存缓存

SDWebImageCacheMemoryOnly = 1 << 2,

//这个标志可以渐进式下载,显示的图像是逐步在下载

SDWebImageProgressiveDownload = 1 << 3,

//刷新缓存

SDWebImageRefreshCached = 1 << 4,

//后台下载

SDWebImageContinueInBackground = 1 << 5,

//NSMutableURLRequest.HTTPShouldHandleCookies = YES;

SDWebImageHandleCookies = 1 << 6,

//允许使用无效的SSL证书

//SDWebImageAllowInvalidSSLCertificates = 1 << 7,

//优先下载

SDWebImageHighPriority = 1 << 8,

//延迟占位符

SDWebImageDelayPlaceholder = 1 << 9,

//改变动画形象

SDWebImageTransformAnimatedImage = 1 << 10,

二、SDImageCacheType所有选项：

SDImageCacheType 当下载请求结束时,通过这个枚举来告知图片的来源

if (cacheType == SDImageCacheTypeNone) {

NSLog(@"网络");

}else if (cacheType == SDImageCacheTypeDisk) {

NSLog(@"设备硬盘");

}else if (cacheType == SDImageCacheTypeMemory) {

NSLog(@"内存");

}
```