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
    
    
    internal func setupUI(topScrollView: UIScrollView,_ childViewControllers: [UIViewController]){
        // 移除原有数据
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
        self.topScrollView = topScrollView
        self.childViewControllers = childViewControllers
        //绑定数据
        setContentCV(0)
        self.contentSize = CGSize(width: CGFloat(childViewControllers.count) * SCREEN_WIDTH, height: 0)
        self.pagingEnabled = true
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
        newsVc.view.frame = CGRect(x: CGFloat(index) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: self.frame.height)
    }
    
    
    
   internal func toFirst(){
        // 视图滚动到第一个位置
        self.setContentOffset(CGPoint(x: 0, y: self.contentOffset.y), animated: true)
    }
    
    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
}

