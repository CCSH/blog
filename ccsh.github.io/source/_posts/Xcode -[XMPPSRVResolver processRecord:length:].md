---
title: Xcode -[XMPPSRVResolver processRecord:length:]
categories:
  - Xcode
tags:
  - 问题
comments: true
---


<!-- more -->
"_dns_free_resource_record", referenced from: -[XMPPSRVResolver processRecord:length:] in libEaseMobClientSDKLite.a(XMPPSRVResolver.o)

这样的错误，是由于缺少库：

添加libresolv.dylib库，就可以了
![效果](https://upload-images.jianshu.io/upload_images/1897259-8f7cb547a8e05cce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
