---
title: iOS 常用控件之UIScrollView
categories:
  - iOS
tags:
  - 知识
comments: true
---


常用控件之UIScrollView
<!-- more -->
```
#pragma mark - UIScrollViewDelegate
```
```
/* 此方法在scrollView滑动时会被调用多次，只要scrollView.contentOffset发生改变就会被调用 */
(void)scrollViewDidScroll:(UIScrollView *)scrollView

/* 在一次拖动滑动中最后被调用，在
(void)scrollViewDidScroll:(UIScrollView *)scrollView；
之后 */
(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

/* 此方法在拖动结束后将要开始减速时被调用 */
(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

/*此方法在手动滑动时不会调用，只有在
(void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;
(void)scrollRectToVisible:(CGRect) animated:(BOOL)animated; 
调用后才调用 */
(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView

/* 此方法在开始减速时被调用,再一次拖动滑动中最先被调用 */
(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView

/* 当scale发生改变时，调用此方法，此方法会被调用多次 */
(void)scrollViewDidZoom:(UIScrollView *)scrollView

/* 当滚动视图滚动到最顶端后，执行该方法 */
(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView

/* 此方法在拖动开始时被调用，一次拖动抵用一次，未发生触控不会被调用 */
(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

/* 此方法在scale开始时被调用，一次scale调用一次 */
(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view

/* 特别注意这个方法，此方法可以获取Velocity可以用于判断滑动方向，tarContentOffset可以用于判断是否会已经滑动翻页 */
(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset

/* zoom之后会被调用，可以用atScale得到zoom值从而进行进一步处理 */
(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale

//此方法设置可以scale的view
(nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView { if (scrollView == self.myScrollView2) { NSLog(@"hahah"); return self.Views[0]; } return nil; }
```