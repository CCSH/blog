---
title: iOS APP各种状态（进入后台，前台等整理）
categories:
  - iOS
tags:
  - tableview
comments: true
---


APP各种状态（进入后台，前台等整理）
<!-- more -->
```
#pragma mark - 程序将要进入后台
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    DLog(@"程序将要进入后台");
    
}

#pragma mark - 程序进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    DLog(@"程序进入后台");
    
}

#pragma mark - 程序将要进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    DLog(@"程序将要进入前台");
    
}

#pragma mark - 程序进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    DLog(@"程序进入前台");
    
}

```