---
title: iOS QuickLook预览文件功能
categories:
  - iOS
tags:
  - 知识
comments: true
---

<!-- more -->

1、想要使用此功能首先要在工程内加入框架

```
QuickLook.framework
```

2、在你需要展示的界面加入头文件

```
#import <QuickLook/QuickLook.h>
```

3、实例化

```
    QLPreviewController *myQlPreViewController = [[QLPreviewController alloc]init];
    myQlPreViewController.delegate =self;
    myQlPreViewController.dataSource =self;
    [myQlPreViewController setCurrentPreviewItemIndex:0];
    //此处可以带导航栏跳转、也可以不带导航栏跳转、也可以拿到View进行Add
    [self.navigationController pushViewController:myQlPreViewController animated:YES];
```

4、代理方法

```
#pragma mark - QLPreviewController代理
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{

    NSString* path = [[NSBundle mainBundle] pathForResource:arr[IndeX] ofType:nil];
    return [NSURL fileURLWithPath:path];
}

- (void)previewControllerDidDismiss:(QLPreviewController *)controller
{
    NSLog(@"预览界面已经消失");
}

//文件内部链接点击不进行外部跳转
- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item
{
    return NO;
}
```
