//
//  CollapsingScrollView.swift
//  Test1026
//
//  Created by kokuma on 2016/12/31.
//  Copyright © 2016年 kokuma. All rights reserved.
//


import UIKit

class CollapsingScrollView: UIScrollView {
    /// 内容区域scrollView x轴偏移量
    var contentOffsetY: CGFloat = 0.0
    
    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        
        prepareUI()
        print("CollapsingScrollView-init")
    }
    
    func prepareUI(){
        //alwaysBounceVertical = true
       // bounces = false
       // scrollEnabled = true
       // showsHorizontalScrollIndicator = false
        
        showsVerticalScrollIndicator = true
        addSubview(topView)
        topView.addSubview(topBar)
        //addSubview(topBar2)
        addSubview(bottomView)
        bottomView.addSubview(label)
        //topView.userInteractionEnabled = true
        //topBar.userInteractionEnabled = true
       // bottomView.userInteractionEnabled = true
       layoutChildren()
        //layoutIfNeeded()
       // contentSize = CGSize(width: 0, height: 1090)
    }
    
   func  layoutChildren(){
    topView.snp_makeConstraints { (make) in
        make.top.equalTo(0)
        make.left.equalTo(0)
        // make.right.equalTo(0)
        //make.bottom.equalTo(-200)
        make.width.equalTo(SCREEN_WIDTH)
        make.height.equalTo(200)
    }
    topBar.snp_makeConstraints { (make) in
        make.bottom.equalTo(0)
        make.left.equalTo(0)
        make.width.equalTo(SCREEN_WIDTH)
        make.height.equalTo(40)
        
    }
    
    bottomView.snp_makeConstraints { (make) in
        make.top.equalTo(200)
        make.left.equalTo(0)
        make.right.equalTo(0)
        make.width.equalTo(SCREEN_WIDTH)
        make.height.equalTo(2500)
        
    }
    }
   
    lazy var topView : UIImageView = {
       var view = UIImageView()
        view.backgroundColor = UIColor.cyanColor()
        return view
    }()
    
   
    
    lazy var topBar : UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.yellowColor()
        return view
    }()
    lazy var topBar2 : UIView = {
        var view = UIView()
        view.frame = CGRect(x: 0, y: 66, width: SCREEN_WIDTH, height: 40)
        view.backgroundColor = UIColor.yellowColor()
        return view
    }()

    lazy var bottomView : UIView = {
        var view = UIView()
        
        view.backgroundColor = UIColor.orangeColor()
        return view
    }()
    
    lazy var label : UILabel = {
        let view = UILabel(frame: CGRect(x: 10,y: 10,width: 200,height: 200))
        view.backgroundColor = RED
        view.text="kokuma"
        view.numberOfLines = 2;
        view.textAlignment = .Right
        view.lineBreakMode = .ByTruncatingMiddle
         return view
    }()
    
    
}

extension CollapsingScrollView : UIScrollViewDelegate{
    // 滚动结束后触发 代码导致
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
      
        let index = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
    }
    
    
    // 滚动结束 手势导致
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    // 开始拖拽视图   //到达底部为2059.0
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        contentOffsetY = scrollView.contentOffset.y
        print("xxl-BeginDragging-contentOffsetY-\(contentOffsetY)")
    }
    
    
    // 正在滚动
    func scrollViewDidScroll(scrollView: UIScrollView) {
         print("xxl-DidScroll-contentOffsetY-\(scrollView.contentOffset.y)")
        let y = scrollView.contentOffset.y;
        if  y>=150 {
            topView.removeFromSuperview()
           // addSubview(topBar2)
            self.superview?.addSubview(topBar2)
           //layoutChildren()
        }else {
            topBar2.removeFromSuperview()
            addSubview(topView)
            layoutChildren()

        }
    }
}