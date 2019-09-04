---
title: iOS Tabbar的一些设置(背景颜色、点击设置)
categories:
  - iOS
tags:
  - 方法
comments: true
---


<!-- more -->
设置底部标题点击时的颜色
 ```
[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    
UIColor *titleHighlightedColor = [UIColor whiteColor];
    
[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleHighlightedColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
```

设置tabbar选中颜色

iOS7设置如下：
```
[self.tabBarController.tabBarsetSelectedImageTintColor:[UIColor greenColor]];
```

ios8中如下设置：
```
self.tabBar.tintColor=[UIColor greenColor];
```

消除tabbar边框
在appdelegate的程序启动处：
```

[[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];

[[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
```


设置tabbar item原始图标与原始选中图标，而不是系统自动填充的颜色
```
    // 拿到 TabBar 在拿到想应的item
    UITabBar *tabBar = _tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    // 对item设置相应地图片
    item0.selectedImage = [[UIImage imageNamed:@"recognize-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item0.image = [[UIImage imageNamed:@"recognize"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     
    item1.selectedImage = [[UIImage imageNamed:@"life-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item1.image = [[UIImage imageNamed:@"life"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     
    item2.selectedImage = [[UIImage imageNamed:@"edit-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item2.image = [[UIImage imageNamed:@"edit"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     
    item3.selectedImage = [[UIImage imageNamed:@"setting-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item3.image = [[UIImage imageNamed:@"setting"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
```

设置tabbar背景图片
```
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 49)];
    backView.backgroundColor = [UIColor redColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
```