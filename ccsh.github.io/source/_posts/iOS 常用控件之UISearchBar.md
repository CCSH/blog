---
title: iOS 常用控件之UISearchBar
categories:
  - iOS
tags:
  - 
comments: true
---


<!-- more -->
实例化UISearchBar
```
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, SHWidth, 40)];
    //设置提示文字
    searchBar.placeholder = @"搜索";
    //设置边框背景图片
    searchBar.backgroundImage = [UIImage imageNamed:@"searchBar_BG"];
    //设置代理
    searchBar.delegate = self;
    //添加到视图
    self.tableView.tableHeaderView = searchBar;
```
UISearchBar代理方法
```
#pragma mark - UISearchBarDelegate
#pragma mark 搜索文字改变
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

}
#pragma mark 搜索开始编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //设置取消按钮样式
    //首先取出cancelBtn
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"];
    //取消按钮文字
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    //取消按钮文字颜色
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

#pragma mark  编辑
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    //展示取消按钮
    searchBar.showsCancelButton = YES;
 
    return YES;
}
#pragma mark  编辑
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
#pragma mark 取消按钮点击
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    //收起键盘
    [searchBar resignFirstResponder];
    //隐藏取消按钮
    [searchBar setShowsCancelButton:NO animated:YES];
  
}

```