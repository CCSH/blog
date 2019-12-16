---
title: Flutter 序列化与反序列化
categories:
  - Flutter
tags:
  - 操作
comments: true
---

Flutter 序列化与反序列化

<!-- more -->

```

dependencies:
  json_annotation: ^3.0.0

dev_dependencies:
  build_runner: ^1.7.0
  json_serializable: ^3.2.3


import 'package:json_annotation/json_annotation.dart';
part 'info_model.g.dart';

@JsonSerializable()
class Info {
  String name;
  String userid;

  Info({
    this.name,
    this.userid,
  });
  //反序列化
  factory Info.fromJson(Map<String, dynamic> json) {
    return _$InfoFromJson(json);
  }

  //序列化
  Map<String, dynamic> toJson() {
    return _$InfoToJson(this);
  }
}

//一次
flutter pub run build_runner build
//监听
flutter packages pub run build_runner watch



```
