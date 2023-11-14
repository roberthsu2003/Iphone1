## UIScrollView,UIPageControl
- UIScrollView的isPagingEnabled = true
- UIScrollView的contentSize一定要設定
- the scroll view doesn't let the user scroll freely
- 固定移動一個範圍
- 實作UIScrollView的delegate
    - scrollViewWillBeginDecelerating(_:)
    - scrollViewDidEndDecelerating(_:)
    
- UIPageControl的valueChange event
