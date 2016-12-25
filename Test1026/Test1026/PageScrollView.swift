//  PageScrollView.swift
//  Test1026
//
//  Created by kokuma on 16/10/26.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class PageScrollView: UIScrollView {
    
    weak var topScrollView: UIScrollView?
    var childViewControllers: [UIViewController]?
    /// 内容区域scrollView x轴偏移量
    var contentOffsetX: CGFloat = 0.0

    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    internal func setupUI(topScrollView: UIScrollView,_ childViewControllers: [UIViewController]){
        // 移除原有数据
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
        self.topScrollView = topScrollView
        self.childViewControllers = childViewControllers
        
        self.contentSize = CGSize(width: CGFloat(childViewControllers.count) * SCREEN_WIDTH, height: 0)
        self.pagingEnabled = true
        //绑定数据
        print("setupUI-\(SCREEN_WIDTH)")
        setContentCV(0)
        toFirst()
    }
    
    
    internal func setContentCV(index: Int) {
        // 获取需要展示的控制器
        let newsVc = childViewControllers![index]
        
        // 如果已经展示则直接返回
        if newsVc.view.superview != nil {
            return
        }
        
        self.addSubview(newsVc.view)
        if index == 0{
            newsVc.view.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.frame.height)
        }else {
             newsVc.view.frame = CGRect(x: CGFloat(index) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: self.frame.height)
        }
       
    }
    
    
    
   internal func toFirst(){
        // 视图滚动到第一个位置
       // self.setContentOffset(CGPoint(x: 0, y: self.contentOffset.y), animated: true)
    }
    
    
}

extension PageScrollView : UIScrollViewDelegate{
    // 滚动结束后触发 代码导致
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        guard let topScrollView = topScrollView else{
            return
        }
        let index = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        // 滚动标题栏
        let titleLabel = topScrollView.subviews[index]
        var offsetX = titleLabel.center.x - topScrollView.frame.size.width * 0.5
        let offsetMax = topScrollView.contentSize.width - topScrollView.frame.size.width
        
        if offsetX < 0 {
            offsetX = 0
        } else if (offsetX > offsetMax) {
            offsetX = offsetMax
        }
        
        // 滚动顶部标题
        topScrollView.setContentOffset(CGPoint(x: offsetX, y: topScrollView.contentOffset.y), animated: true)
        
        // 恢复其他label缩放
        for i in 0..<childViewControllers!.count {
            if i != index {
                let topLabel = topScrollView.subviews[i] as! JFTopLabel
                topLabel.scale = 0.0
            }
        }
        
    }
    
    // 滚动结束 手势导致
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    // 开始拖拽视图
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        contentOffsetX = scrollView.contentOffset.x
    }
    

    // 正在滚动
    func scrollViewDidScroll(scrollView: UIScrollView) {
        guard let topScrollView = topScrollView else{
            return
        }
        guard let childViewControllers = childViewControllers else{
            return
        }
        
        let value = (scrollView.contentOffset.x / scrollView.frame.width)
        
        let leftIndex = Int(value)
        let rightIndex = leftIndex + 1
        let scaleRight = value - CGFloat(leftIndex)
        let scaleLeft = 1 - scaleRight
        
        let labelLeft = topScrollView.subviews[leftIndex] as! JFTopLabel
        labelLeft.scale = scaleLeft
        let countTotal = topScrollView.subviews.count
        print("scrollViewDidScroll-\(countTotal)")
        if rightIndex < childViewControllers.count {
            let labelRight = topScrollView.subviews[rightIndex] as! JFTopLabel
            labelRight.scale = scaleRight
        }
        
        var index = Int(value)
        
        // 根据滑动方向计算下标
        if scrollView.contentOffset.x - contentOffsetX > 2.0 {
            index = (value - CGFloat(Int(value))) > 0 ? Int(value) + 1 : Int(value)
        } else if contentOffsetX - scrollView.contentOffset.x > 2.0 {
            index = (value - CGFloat(Int(value))) < 0 ? Int(value) - 1 : Int(value)
        }
        
        // 控制器角标范围
        if index > childViewControllers.count - 1 {
            index = childViewControllers.count - 1
        } else if index < 0 {
            index = 0
        }
        
        print("index-\(index)")
        setContentCV(index)
        
//        // 获取需要展示的控制器
//        let newsVc = childViewControllers[index]
//        
//        // 如果已经展示则直接返回
//        if newsVc.view.superview != nil {
//            return
//        }
//        
//        self.addSubview(newsVc.view)
//        newsVc.view.frame = CGRect(x: CGFloat(index) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: self.frame.height)
        
    }

}

