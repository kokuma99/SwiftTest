//
//  AcgCell.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class AcgCollectionCell: BaseColectionViewCell{
    
    
    override func bindUI() {
        super.bindUI()
        let data = self.data as! AcgBean
        imageView_bg.setImageWithURL(NSURL(string: data.frontCover==nil ? "" : "\(data.frontCover)@1000w_"))
        label_title.text = data.name
        let f = data.likeCount
        
        label_content.text = "\(f)"
    }
    
    
    override func prepareUI() {
        //super.prepareUI()
        label_content.textAlignment = .Left
        contentView.addSubview(imageView_bg)
         contentView.addSubview(imageView_avatar)
        contentView.addSubview(label_content)
        contentView.addSubview(label_title)
        imageView_bg.snp_makeConstraints { (make) in
            // make.edges.equalTo(contentView)
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-50)
        }
        imageView_avatar.snp_makeConstraints { (make) in
            make.left.equalTo(10)
            make.centerY.equalTo(imageView_bg.snp_bottom)
            make.width.equalTo(20)
            make.height.equalTo(20)
            
        }
        
        label_title.snp_makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.right.equalTo(-50)
            make.left.equalTo(50)
        }
        label_content.snp_makeConstraints { (make) in
            make.bottom.equalTo(-10)
            // make.right.equalTo(label_follow.snp_left).offset(-10)
            make.right.equalTo(-10)
            
           // make.width.equalTo(120)
            make.height.equalTo(13)
        }
    }
}