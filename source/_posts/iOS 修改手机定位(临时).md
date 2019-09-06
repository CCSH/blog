---
title: iOS 修改手机定位(临时)
categories:
  - iOS
tags:
  - 随笔
comments: true
---

<!-- more -->
1、新建Xcode工程
2、创建gpx文件
![image.png](https://upload-images.jianshu.io/upload_images/1897259-4bf7aa7b986da565.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
3、编辑gpx文件
```
<?xml version="1.0"?>
<gpx version="1.1" creator="Xcode" >
        <!--
         高德坐标 https://lbs.amap.com/console/show/picker
         -->
        <!--
         高德坐标转wgs84 http://www.dituwa.com/tool/gpxaxes
         -->
<!--        下方需要wgs84坐标 不是的需要转换-->
        <!--    银多网-->
        <wpt lat="45.73832803" lon="126.66123930">
    </wpt>
    
</gpx>

```

>需要经过坐标转换之后才可以使用
[坐标查询](https://lbs.amap.com/console/show/picker)
[wgs84转换工具](http://www.dituwa.com/tool/gpxaxes)

4、设置scheme
![image.png](https://upload-images.jianshu.io/upload_images/1897259-f37cc3e23c841b83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>没有的话编译一次

5、运行到手机即可看到效果 停止工程或者过一段时间定位就会恢复原状

[代码地址]([https://github.com/CCSH/Modify_Mobile_GPS)
