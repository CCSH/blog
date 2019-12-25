---
title: Flutter 自定义组件之列表头悬浮
categories:
  - Flutter
tags:
  - 操作
comments: true
---

核心

```
import 'package:flutter/material.dart';

class SHSectionHeadConfig {
  //悬浮组件key集合
  List<GlobalKey> keyList = [];
  //列表滚动方向
  Axis scrollDirection = Axis.vertical;
  //当前悬浮
  int currentIndex = -1;
  //偏移位置
  double offset = 0;
  //悬浮位置(相对于设备)
  double position = 0;

  //悬浮组件的大小
  Size _size;

  /// MARK:处理数据
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {type}
  //  @return: 是否需要刷新
  //  @Deprecated: 否
  //  备注
  bool handleData() {
    int _currentIndex = -1;
    Offset _off = Offset(0.0, -position);
    if (scrollDirection == Axis.horizontal) {
      _off = Offset(position, 0.0);
    }

    for (var i = keyList.length - 1; i >= 0; i--) {
      GlobalKey key = keyList[i];
      if (key.currentContext != null) {
        RenderBox render = key.currentContext.findRenderObject();
        Offset renderOffset = render.localToGlobal(_off);
        //取出滚动方向对应的数据
        double location = renderOffset.dy;
        if (scrollDirection == Axis.horizontal) {
          location = renderOffset.dx;
        }

        if (location <= 0) {
          //找到最后一个悬浮的
          _currentIndex = i;
          _size = render.size;
          break;
        }
      }
    }

    //加一层复用保护
    if (_currentIndex < 0 && currentIndex >= 0) {
      GlobalKey key = keyList[currentIndex];
      if (key.currentContext == null) {
        _currentIndex = currentIndex;
      } else {
        _currentIndex = currentIndex - 1;
      }
    }

    double _offset = 0;
    //存在悬浮的
    if (_currentIndex >= 0) {
      //取出下一个位置
      if ((_currentIndex + 1) < keyList.length) {
        GlobalKey key = keyList[_currentIndex + 1];
        if (key.currentContext != null) {
          RenderBox render = key.currentContext.findRenderObject();
          Offset renderOffset = render.localToGlobal(_off);
          //取出滚动方向对应的数据
          double offsetAxis = renderOffset.dy;
          double sizeAxis = _size.height;

          if (scrollDirection == Axis.horizontal) {
            offsetAxis = renderOffset.dx;
            sizeAxis = _size.width;
          }
          //计算偏移位置
          if (offsetAxis < sizeAxis) {
            _offset = offsetAxis - sizeAxis;
          }
        }
      }
    }

    if (_currentIndex != currentIndex || _offset != offset) {
      currentIndex = _currentIndex;
      offset = _offset;
      return true;
    }

    return false;
  }
}

```

使用

```
import 'package:flutter/material.dart';
import 'package:flutter_app/tool/data_helper.dart';
import 'package:flutter_app/tool/color_helper.dart';
import 'package:flutter_app/tool/scction_head_helper.dart';

class CSHColumnList extends StatefulWidget {
  @override
  _CSHListState createState() => _CSHListState();
}

class _CSHListState extends State<CSHColumnList> {
  ScrollController _listScrollC = ScrollController();
  SHSectionHeadConfig config = SHSectionHeadConfig();

  @override
  void initState() {
    super.initState();

    //初始化model
    for (var i = 0; i < 4; i++) {
      config.keyList.add(GlobalKey());
    }
    config.position = 100.0;

    _listScrollC.addListener(() {
      if (config.handleData()) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('列悬浮'),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              controller: _listScrollC,
              itemBuilder: (BuildContext context, int index) {
                if (index == 1) {
                  return getHeadView(0, true);
                }

                if (index == 9) {
                  return getHeadView(1, true);
                }

                if (index == 20) {
                  return getHeadView(2, true);
                }

                if (index == 30) {
                  return getHeadView(3, true);
                }
                return Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '我是第 --- $index',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                );
              },
              itemCount: 50,
            ),
            handleHead(),
          ],
        ));
  }

  /// MARK:处理悬浮头部
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {type}
  //  @return:
  //  @Deprecated: 否
  //  备注
  Widget handleHead() {
    Widget widget = Container();
    //需要悬浮
    if (config.currentIndex >= 0) {
      widget = Positioned(
        top: config.offset,
        child: getHeadView(config.currentIndex, false),
      );
    }

    return widget;
  }

  /// MARK:获取头部组件
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {type}
  //  @return:
  //  @Deprecated: 否
  //  备注
  Widget getHeadView(int index, bool isKey) {
    return Container(
      key: isKey ? config.keyList[index] : null,
      height: 90,
      width: CommonData.screenW,
      color: isKey ? randomColor() : Colors.cyan,
      alignment: Alignment.center,
      child: Text(
        '我是head === $index',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
```
