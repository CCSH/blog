---
title: iOS 权限获取
categories:
  - iOS
tags:
  - 权限获取
comments: true
---


<!-- more -->
iOS 8 以后需要进行plist文件配置
[plist文件配置](http://www.jianshu.com/p/d407d2d477f1)

####摄像头权限
```
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (authStatus == AVAuthorizationStatusRestricted|| authStatus == AVAuthorizationStatusDenied) {//没有权限
        

    }else{
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {//成功获取
            

        }else{//没有摄像头

        }

    }

```      

####麦克风权限
```
[[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        
        if (granted) {//成功访问
            
        } else {//访问受限
            
        }
    }];

```
####照片权限
```
if ([PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized) {//成功访问

}else{//访问受限

}
```
####定位权限
```
//判断定位用户权限
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    //判断状态
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways://一直获取
            
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse://使用期间
            
            break;
        case kCLAuthorizationStatusDenied://用户禁止

            break;
        case kCLAuthorizationStatusNotDetermined://未做决定
        {
            //获取权限
            //使用期间使用 NSLocationWhenInUseUsageDescription
            [_locationManager requestWhenInUseAuthorization];
            //一直使用 NSLocationAlwaysUsageDescription
//            [_locationManager requestAlwaysAuthorization];
        }
            break;
        case kCLAuthorizationStatusRestricted://受限制

            break;
        default:
            break;
    }
```
####通讯录权限
```
ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    //请求访问用户通讯录，无论成功与否block都会调用
    ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
        
        if (granted) {//成功访问
            
        }else{//访问受限

        }
    });

```
