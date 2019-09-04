---
title: TableViewCell 下划线或分割线长度与颜色问题
categories:
  - iOS
tags:
  - 问题
comments: true
---


TableViewCell 下划线或分割线长度与颜色问题
<!-- more -->
```
- (void)viewDidLoad {

[super viewDidLoad];

//UIEdgeInsetsZero 下划线为屏幕的宽
//UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>) 细微调整

//下划线位置
[self.tableView setSeparatorInset:UIEdgeInsetsZero];

//下划线颜色

[self.tableView setSeparatorColor:[UIColor xxxx ]];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{

UITableViewCell *cell;

[cell setSeparatorInset:UIEdgeInsetsZero];

[cell setLayoutMargins:UIEdgeInsetsZero];

return cell;

}
```