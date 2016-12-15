//
//  UserCell.swift
//  Test1026
//
//  Created by kokuma on 2016/12/6.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class UserCell: BaseTableCell{
    override func bindUI() {
       super.bindUI()
        let data = self.data as! OpenAccountBean
        imageView_avatar.setImageWithURL(NSURL(string: data.avatarUrl==nil ? "" : data.avatarUrl!))
        label_title.text = data.displayName
        //let c = data.exts
        guard let c = data.exts else{
            return
        }
       // let f = data.exts?.dateCosstart
        label_content.text = "aaa"
        
    }
     
}
