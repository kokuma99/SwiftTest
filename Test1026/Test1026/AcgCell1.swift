//
//  AcgCell1.swift
//  Test1026
//
//  Created by kokuma on 2016/12/13.
//  Copyright © 2016年 kokuma. All rights reserved.
//

//AcgCell

import UIKit

class AcgCell: BaseTableCell{
    override func bindUI() {
        super.bindUI()
        let data = self.data as! AcgBean
        imageView_avatar.setImageWithURL(NSURL(string: data.frontCover==nil ? "" : data.frontCover!))
        label_title.text = data.name
        //let c = data.exts
        let content = data.count;
        // let f = data.exts?.dateCosstart
        label_content.text = "订阅：\(content)"
        
    }
    
}