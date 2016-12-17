//
//  AvatarGroupView.swift
//  Test1026
//
//  Created by kokuma on 2016/12/15.
//  Copyright © 2016年 kokuma. All rights reserved.
//

//AvatarGroupView
import UIKit

class AvatarGroupView: UIView {
    
    // MARK: 属性
    var data: OpenAccountBean? {
        didSet {
            //用户列表版table
            //   imageView_avatar.yy_imageURL = NSURL(string: videoInfo!.cover!)
            //  titleLabel.text = videoInfo!.title!
            bindUI()
        }
    }
    
    
     func bindUI(){
        //绑定数据
       bindUserAccount(data!, imageView_avatar: imageView_avatar, label_title: label_title, label_content: label_content)
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
        
        addSubview(imageView_avatar)
        addSubview(label_title)
        addSubview(label_content)
        imageView_avatar.snp_makeConstraints { (make) in
            // make.edges.equalTo(contentView)
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.size.equalTo(CGSize(width: AVATAR_HEIGHT, height: AVATAR_HEIGHT))
        }
        
        
        label_title.snp_makeConstraints { (make) in
            make.centerY.equalTo(imageView_avatar).offset(-10)
            make.left.equalTo(imageView_avatar.snp_right).offset(10)
        }
        
        label_content.snp_makeConstraints { (make) in
            make.left.equalTo(label_title.snp_left)
            make.top.equalTo(label_title.snp_bottom).offset(10)
           // make.right.equalTo(-50)
        }
    }
    
    
    /// 图标
    lazy var imageView_avatar: UIImageView = {
        let view = getAvatarImageView()
        view.backgroundColor = UIColor.blueColor()
        return view
    }()
    
    /// 标题
    lazy var label_title: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.backgroundColor = UIColor.clearColor()
        view.textAlignment = NSTextAlignment.Center
        view.font = UIFont.systemFontOfSize(14)
        view.text = "你的名字"
        view.textColor = UIColor.colorWithHexString("#333333")
        return view
    }()
    
    /// 内容,说说啊什么的
     lazy var label_content: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.backgroundColor = UIColor.clearColor()
        view.textAlignment = NSTextAlignment.Center
        view.font = UIFont.systemFontOfSize(12)
        view.textColor = UIColor.colorWithHexString("#999999")
        view.text = "我是小柠檬"
        return view
    }()}
