---
title: iOS 网络判断(2G、3G、4G、WiFi、无网络)
categories:
  - iOS
tags:
  - 随笔
comments: true
---


网络判断(2G、3G、4G、WiFi、无网络)
<!-- more -->
- 网络判断

```
- (IBAction)btnClick:(UIButton *)sender {
    
    int networkType = [self getNetworkStates];
    
    switch (networkType) {
        case 1:
        {
            [sender setTitle:@"2G" forState:0];
        }
            break;
        case 2:
        {
            [sender setTitle:@"3G" forState:0];
        }
            break;
        case 3:
        {
            [sender setTitle:@"4G" forState:0];
        }
            break;
        case 5:
        {
            [sender setTitle:@"WiFi" forState:0];
        }
            break;
        default:
        {
            [sender setTitle:@"无网络" forState:0];
        }
            break;
    }
}

// 判断网络类型
- (int)getNetworkStates
{
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];

    for (id child in subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            return [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    return 0;
}
```