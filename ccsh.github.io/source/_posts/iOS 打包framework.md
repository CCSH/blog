---
title: iOS 打包framework
categories:
  - iOS
tags:
  - 知识
comments: true
---


<!-- more -->
####1、打开Xcode，新建工程

![打开Xcode，新建工程](http://upload-images.jianshu.io/upload_images/1897259-9f833e52a8d798f8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####2、起个名字

![起个名字](http://upload-images.jianshu.io/upload_images/1897259-5078445d6e7a9b4d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####3、创建成功

![创建成功](http://upload-images.jianshu.io/upload_images/1897259-ce860cadb279d592.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####4、实现功能

![实现功能](http://upload-images.jianshu.io/upload_images/1897259-955727fff89380b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

.h
```
+ (void)sayHello;
```
.m
```
+ (void)sayHello{
    NSLog(@"hello word!!");
}
```

####5、配置参数

![在TARGETS下选中工程，在Build Settings下更改几个参数](http://upload-images.jianshu.io/upload_images/1897259-35216aab4144e6cc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![在Architectures下增加armv7s](http://upload-images.jianshu.io/upload_images/1897259-704d83750f622e42.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![将Build Active Architecture Only 设置为NO](http://upload-images.jianshu.io/upload_images/1897259-052a4e92cc7abafe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![将你要公开的头文件拖至Public下，要隐藏的放在Private或者Project下，当然，隐藏的头文件就无法再被引用](http://upload-images.jianshu.io/upload_images/1897259-41e6d76aa77021aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![然后需要在test.h（必须是公开的，否则无法引用）中将你所有要公开的.h引入](http://upload-images.jianshu.io/upload_images/1897259-fb7220de8a83ecae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####6、最后一步进行打包

1.选中模拟器，编译程序 command + b

2.选中测试机，编译程序 command + b

3.在finder中找到framework文件，然后右键show in finder

![然后右键show in finder](http://upload-images.jianshu.io/upload_images/1897259-1b9297b9427055d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.会发现一个真机一个模拟器

![一个真机一个模拟器](http://upload-images.jianshu.io/upload_images/1897259-7201ce98230bf688.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5.合并成一个征集与模拟器都可以使用framework

![将模拟器与真机的此文件合成一个](http://upload-images.jianshu.io/upload_images/1897259-142e33f09f8a0999.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
打开控制台输入 
lipo -create "真机版本路径" "模拟器版本路径" -output "合并后的文件路径"
```
然后回车
红色：真机文件路径
绿色：模拟器文件路径
黄色：新文件路径

![演示](http://upload-images.jianshu.io/upload_images/1897259-e521dbf48188d44b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

6.得到一个合并完成的文件（如果有文件格式lipo直接去除）

![最后结果](http://upload-images.jianshu.io/upload_images/1897259-470f358283ae95b5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


7.替换之前的文件

![新生成的替换之前的](http://upload-images.jianshu.io/upload_images/1897259-f3e70d50e68725f6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

8.生成framework

![此文件就是最终的framework](http://upload-images.jianshu.io/upload_images/1897259-661bb1569c018683.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

9.测试

![成功](http://upload-images.jianshu.io/upload_images/1897259-c913f2bec64bb330.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)