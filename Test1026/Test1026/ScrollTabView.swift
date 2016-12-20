//  ScrollTabView.swift
//  Test1026
//
//  Created by kokuma on 16/10/26.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class ScrollTabView: UIScrollView {
    
    weak var contentScrollView: UIScrollView?
    
    // 栏目数组
    private var selectedArray: [[String : String]]?{
        didSet {
            // 移除原有数据 - 为的是排序栏目后的数据清理
//            for subView in self.subviews {
//                if subView.isKindOfClass(JFTopLabel.classForCoder()) {
//                    subView.removeFromSuperview()
//                }
//            }
//            bindUI()
        }
    }
    
    
    internal func bindUI(){
        //绑定数据
        addContent()
    }
    
    
    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    
    // MARK: - 准备UI
    func prepareUI() {
        setupColumn()
        addContent()
    }
    
    /**
     初始化栏目
     */
    private func setupColumn() {
        let tempSelectedArray = NSUserDefaults.standardUserDefaults().objectForKey("selectedArray") as? [[String : String]]
        // let tempOpti NSUserDefaults.standardUserDefaults().objectForKey("optionalArray") as? [[String : String]]
        
        if tempSelectedArray != nil {
            selectedArray = tempSelectedArray != nil ? tempSelectedArray : [[String : String]]()
            //  opti tempOptionalArray != nil ? tempOptionalArray : [[String : String]]()
        } else {
            // 默认栏目顺序 - 可以直接存plist文件
            selectedArray = [
                [
                    "classid" : "0",
                    "classname" : "今日推荐"
                ],
                [
                    "classid" : "1",
                    "classname": "奇闻异事"
                ],
                [
                    "classid" : "2",
                    "classname": "未解之谜"
                ],
                [
                    "classid" : "3",
                    "classname": "天文航天"
                ],
                [
                    "classid" : "4",
                    "classname": "UTO探索"
                ],
                [
                    "classid" : "5",
                    "classname": "神奇地球"
                ],
                [
                    "classid" : "7",
                    "classname": "震惊事件"
                ],
                [
                    "classid" : "8",
                    "classname": "迷案追踪"
                ],
                [
                    "classid" : "9",
                    "classname": "灵异恐怖"
                ],
                [
                    "classid" : "10",
                    "classname": "历史趣闻"
                ],
                [
                    "classid" : "11",
                    "classname": "军事秘闻"
                ]
            ]
            
            
            // 默认栏目保存
            NSUserDefaults.standardUserDefaults().setObject(selectedArray, forKey: "selectedArray")
            // NSUserDefaults.standardUserDefaults().setObject(optionalArray, forKey: "optionalArray")
        }
        
    }
    
    /**
     添加顶部标题栏和控制器
     */
    private func addContent() {
        
        // 布局用的左边距
        var leftMargin: CGFloat = 0
        
        for i in 0..<selectedArray!.count {
            let label = JFTopLabel()
            label.text = selectedArray![i]["classname"]
            label.tag = i
            label.scale = i == 0 ? 1.0 : 0.0
            label.userInteractionEnabled = true
            addSubview(label)
            
            // 利用layout来自适应各种长度的label
            label.snp_makeConstraints(closure: { (make) -> Void in
                make.left.equalTo(leftMargin + 15)
                make.centerY.equalTo(0)
            })
            
            // 更新布局和左边距
            self.layoutIfNeeded()
            leftMargin = CGRectGetMaxX(label.frame)
            
            // 添加标签点击手势
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedTopLabel(_:))))
            
        }
        
        let lastLabel = subviews.last as! JFTopLabel
        // 设置顶部标签区域滚动范围
        self.contentSize = CGSize(width: leftMargin + lastLabel.frame.width, height: 0)
        
    }
    
    /**
     顶部标签的点击事件
     */
    @objc private func didTappedTopLabel(gesture: UITapGestureRecognizer) {
        let titleLabel = gesture.view as! JFTopLabel
        // 让内容视图滚动到指定的位置
        guard let contentScroll = contentScrollView else{
            return
        }
        
        contentScroll.setContentOffset(CGPoint(x: CGFloat(titleLabel.tag) * contentScroll.frame.size.width, y: contentScroll.contentOffset.y), animated: true)
    }
    
   
}
