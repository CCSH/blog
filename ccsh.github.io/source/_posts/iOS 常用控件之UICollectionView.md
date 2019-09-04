---
title: iOS 常用控件之UICollectionView
categories:
  - iOS
tags:
  - 知识
comments: true
---


<!-- more -->
```
#pragma mark - 懒加载
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        //UICollectionView的自动布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //设置滑动方向
        //UICollectionViewScrollDirectionHorizontal  水平滑动
        //UICollectionViewScrollDirectionVertical    竖直滑动
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //下放两个属性可以在这里设置也可以在下方代理中设置（默认10）
        //设置水平间距（内部）
        layout.minimumInteritemSpacing = 5;
        //设置竖直间距（内部）
        layout.minimumLineSpacing = 5;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SHWidth, SHHeight - 64) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [self.view addSubview:_collectionView];
        
        //注册cell类
        [_collectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    }
    
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSoure.count;
}

#pragma mark 实例化UICollectionView
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SHChatBGDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //设置数据
    [cell setCellDataSoure:self.dataSoure IndexPath:indexPath select:self.select];
    
    return cell;
}

#pragma mark 设置item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //竖直滑动时：
    //item排列：最左边的item根据collectionView的最左边的点去做长和高（向左向下），最右边的item根据collectionView的最右边的点去做长和高（向右向下）
    //水平滑动时：
    //item排列：最上边和左边的item根据collectionView的最上边和左边的点去做长和高（向左向下），最下边和最左边的item根据collectionView的最下边和最左边的点去做长和高（向右向上）
    return CGSizeMake((SHWidth - 20)/3, (SHWidth - 20)/3);
}

#pragma mark collectionView边间距(整体collectionView的上左下右)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    //上左下右
    return UIEdgeInsetsMake(10, 5, 0, 5);
}

#pragma mark 点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

```