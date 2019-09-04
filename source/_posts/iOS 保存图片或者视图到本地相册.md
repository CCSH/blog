---
title: iOS 保存图片或者视图到本地相册
categories:
  - iOS
tags:
  - 方法
comments: true
---


保存图片或者视图到本地相册
<!-- more -->
```
#pragma mark - 保存视图
   
   UIGraphicsBeginImageContextWithOptions(view.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]init];
    
    [assetsLibrary writeImageToSavedPhotosAlbum:[viewImage CGImage] orientation:(ALAssetOrientation)viewImage.imageOrientation completionBlock:^(NSURL *assetURL, NSError *error) {
        [SHToast showWithText:@"保存成功"];
    }];
```