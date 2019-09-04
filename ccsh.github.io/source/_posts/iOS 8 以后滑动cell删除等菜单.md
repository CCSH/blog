---
title: iOS 8 以后滑动cell删除等菜单
categories:
  - iOS
tags:
  - 知识
comments: true
---


iOS 8 以后滑动cell删除等菜单
<!-- more -->
```
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *row1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"编辑", nil) handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%ld的编辑",(long)indexPath.row);
    }];
    row1.backgroundColor = [UIColor orangeColor];
    
    UITableViewRowAction *row2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"删除了", nil) handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%ld的删除",(long)indexPath.row);
    }];
    row2.backgroundColor = [UIColor blueColor];
    
    return @[row1,row2];
}
```