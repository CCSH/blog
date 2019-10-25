---
title: Mac 安装Flutter环境
categories:
  - 随笔
tags:
  - 操作
comments: true
---


Mac 安装Flutter环境
<!-- more -->
```
安装flutter

//打开环境变量配置
open ~/.bash_profile

//加入下面环境变量
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

//生效
source ~/.bash_profile

//下载安装flutter
git clone -b master https://github.com/flutter/flutter.git

./flutter/bin/flutter --version

//打开环境变量配置
open ~/.bash_profile

//加一行 xxx 安装目录
export PATH=/xxx/flutter/bin:$PATH

//生效
source ~/.bash_profile

brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods

//配置
flutter doctor -v

其他
//创建flutter
flutter create flutter_module	
	
//升级
flutter upgrade

//查看环境
flutter channel

```