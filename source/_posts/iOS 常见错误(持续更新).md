---
title: iOS 常见错误(持续更新)
categories:
  - iOS
tags:
  - 问题
comments: true
---


<!-- more -->
问题：Unbalanced calls to begin/end appearance transitions for
解决：
如果是自定义的UITabBarController需要加入以下方法
```
#pragma mark - view周期
-(void)viewWillAppear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: YES animated: animated]; 
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}
```
问题：subsystem: com.apple.UIKit, category: Touch, enable_level: 0, persist_level: 0, default_ttl: 1, info_ttl: 0, debug_ttl: 0, generate_symptoms: 0, enable_oversize: 1, privacy_setting: 2, enable_private_data: 0
解决：
![](http://upload-images.jianshu.io/upload_images/1897259-13b03ad38a2e4b18?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](http://upload-images.jianshu.io/upload_images/1897259-f16d3b2539284993?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
添加键值为：OS_ACTIVITY_MODE
Value值为：disable

问题：Xcode8之后访问相册、相机、位置、麦克风、蓝牙等权限
解决：
![](http://upload-images.jianshu.io/upload_images/1897259-65462d6a67224f74.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
NSBluetoothPeripheralUsageDescription
访问蓝牙

NSCalendarsUsageDescription
访问日历

NSCameraUsageDescription
相机

NSPhotoLibraryUsageDescription
相册

NSContactsUsageDescription
通讯录

NSLocationAlwaysUsageDescription
始终访问位置

NSLocationUsageDescription
位置

NSLocationWhenInUseUsageDescription
在使用期间访问位置

NSMicrophoneUsageDescription
麦克风

NSAppleMusicUsageDescription
访问媒体资料库

NSHealthShareUsageDescription
访问健康分享

NSHealthUpdateUsageDescription
访问健康更新

NSMotionUsageDescription
访问运动与健身

NSRemindersUsageDescription
访问提醒事项


问题：Snapshotting a view that has not been rendered results in an empty snapshot. Ensure your view has been rendered at least once before snapshotting or snapshot after screen updates.

解决：将跳转的相机VC属性设置成
picker.modalPresentationStyle = UIModalPresentationOverCurrentContext;

问题：[MC] Reading from public effective user settings.

解决：设置权限的plist需要给一个描述
```