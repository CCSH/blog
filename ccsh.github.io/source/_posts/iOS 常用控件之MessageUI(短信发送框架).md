---
title: iOS 常用控件之MessageUI(短信发送框架)
categories:
  - iOS
tags:
  - 知识
comments: true
---


iOS 常用控件之MessageUI(短信发送框架)
<!-- more -->
```
1、加入框架MessageUI.framework
```
```
2、导入头文件#import <MessageUI/MessageUI.h>
```
```
3、如果需要回调则添加代理<MFMessageComposeViewControllerDelegate>
```
```
4、使用
    // 判断设备能不能发送短信
    if([MFMessageComposeViewController canSendText]){
        
        MFMessageComposeViewController*picker = [[MFMessageComposeViewController alloc] init];
        // 设置委托
        picker.messageComposeDelegate= self;
        // 默认信息内容(可以去服务器进行拉取内容)
        picker.body = @"ABCD";
        // 默认收件人(可多个)
        picker.recipients = @[@"12345678900"];
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }else{
        // 提示用户不能发送短信
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该设备不支持短信功能" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
```   
```
5、代理
#pragma mark MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    // 不管任何状态返回之前界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    NSString *message;
    switch (result){
        case MessageComposeResultCancelled:
        {
            NSLog(@"取消发送");
            message = @"取消发送";
        }
            break;
        case MessageComposeResultFailed:
        {
            NSLog(@"发送失败");
            message = @"发送失败";
        }
            break;
        case MessageComposeResultSent:
        {
            NSLog(@"发送成功");
            message = @"发送成功";
        }
            break;
            
        default:
            break;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}
```