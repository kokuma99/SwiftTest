//  ItemView.swift
//  Test1026
//
//  Created by kokuma on 16/10/26.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class ItemView: UIView {
    
    // MARK: 属性
    var data: [String : String]? {
        didSet {
            //用户列表版table
            //   imageView_avatar.yy_imageURL = NSURL(string: videoInfo!.cover!)
            //  titleLabel.text = videoInfo!.title!
            bindUI()
        }
    }
    
    
    internal func bindUI(){
        //绑定数据
        let icon_name = self.data!["icon_name"]
        let txt_title = self.data!["title"]
        if icon_name != nil {
            imageView_icon.image = UIImage(named: icon_name!)
        }
        if txt_title != nil {
            label_title.text = txt_title
        }
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
        
        addSubview(imageView_icon)
        addSubview(label_title)
        addSubview(imageView_arrow)
        imageView_icon.snp_makeConstraints { (make) in
            // make.edges.equalTo(contentView)
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.size.equalTo(CGSize(width: ITEM_ICON_HEIGHT, height: ITEM_ICON_HEIGHT))
        }
        
        
        label_title.snp_makeConstraints { (make) in
            make.centerY.equalTo(imageView_icon)
            make.left.equalTo(imageView_icon.snp_right).offset(10)
        }
        
        imageView_arrow.snp_makeConstraints { (make) in
            make.centerY.equalTo(imageView_icon)
            make.right.equalTo(-10)
            make.size.equalTo(CGSize(width: ITEM_ICON_HEIGHT, height: ITEM_ICON_HEIGHT))
        }
    }
    
    
    /// 右侧箭头
    lazy var imageView_arrow: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    /// 图标
    lazy var imageView_icon: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    /// 标题
    lazy var label_title: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.backgroundColor = UIColor.clearColor()
        view.textAlignment = NSTextAlignment.Center
        view.font = UIFont.systemFontOfSize(14)
        view.text = "草稿箱"
        view.textColor = UIColor.colorWithHexString("#333333")
        return view
    }()
}
