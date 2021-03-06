//
//  VenueCell.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class VenueCell: BaseTableCell{
    

    override func bindUI() {
        super.bindUI()
        let data = self.data as! VenueBean
        imageView_bg.setImageWithURL(NSURL(string: data.images==nil ? "" : "\(data.images![0])@1000w_"))
        label_title.text = data.name
         let f = data.tags?[0]
        
        label_content.text = f
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