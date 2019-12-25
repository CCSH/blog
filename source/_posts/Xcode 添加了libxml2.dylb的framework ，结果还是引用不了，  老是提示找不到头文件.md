---
title: Xcode 添加了libxml2.dylb的framework ，结果还是引用不了，  老是提示找不到头文件
categories:
  - Xcode
tags:
  - 
comments: true
---


<!-- more -->
添加了libxml2.dylb的framework ，结果还是引用不了，  老是提示找不到头文件。

这个问题其实比较容易解决，但是Xcode的版本问题确实让开发者头疼。

在Xcode4,2之后，可以在添加了libxml2.dylb之后，点击左上角的project，然后进行Build Settings（这里不管是Project还是targets都行），找到Search Paths选项卡，其下有Header Search Paths条目，双击debug选项，添加/usr/include/libxml2就行了。