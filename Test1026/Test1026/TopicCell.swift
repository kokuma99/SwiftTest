//
//  TopicCell.swift
//  Test1026
//
//  Created by kokuma on 2016/12/13.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class TopicCell: BaseTableCell{
    
    
    override func bindUI() {
        super.bindUI()
        let data = self.data as! DynamicBean
        bindDynamic_topic(data, imageView_cover: imageView_bg, label_title: label_title, label_content: label_content, label_follow : nil)
    }
    
    
    override func prepareUI() {
        //super.prepareUI()
        label_content.textAlignment = .Left
        contentView.addSubview(imageView_bg)
        // contentView.addSubview(imageView_avatar)
        contentView.addSubview(label_content)
        contentView.addSubview(label_title)
        label_title.textColor = UIColor.whiteColor()
        label_content.textColor = UIColor.whiteColor()
        label_content.backgroundColor = UIColor.cyanColor()
        imageView_bg.snp_makeConstraints { (make) in
            // make.edges.equalTo(contentView)
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(0)
        }
        
        label_title.snp_makeConstraints { (make) in
            make.center.equalTo(0)
            make.right.equalTo(-10)
            make.left.equalTo(10)
        }
        label_content.snp_makeConstraints { (make) in
            make.bottom.equalTo(-10)
            // make.right.equalTo(label_follow.snp_left).offset(-10)
            make.left.equalTo(20)
            //make.height.equalTo(100)
        }
    }
    
    
}