//
//  ImgWithTxtView.swift
//  Test1026
//
//  Created by kokuma on 2016/11/19.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit
import SnapKit

class ImgWithTxtView : UITableViewCell{
    var grammar : DynamicBean? {
        didSet {
            guard grammar != nil else {
                return
            }
            labelV.text = "\(grammar?.id)"
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
   required init?(coder aDecoder: NSCoder) {
        fatalError("has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func prepareUI(){
        contentView.backgroundColor = UIColor.cyanColor()
        contentView.addSubview(imgv)
        contentView.addSubview(labelV)
        contentView.addSubview(btn)
    }
    
    private lazy var imgv: UIImageView = {
        let imgv = UIImageView(frame: CGRectMake(0, 0,50,50))
        imgv.image = UIImage(named: "a.jpg")
        return imgv
    }()
    
    private lazy var labelV: UILabel = {
        let lv = UILabel(frame: CGRectMake(0, 30, 80, 20))
        lv.text="ccc"
        lv.font=UIFont.systemFontOfSize(8)
        lv.backgroundColor=UIColor.purpleColor()
        lv.layer.masksToBounds=true
        lv.layer.cornerRadius=8

        return lv
    }()
    
    private lazy var btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("btnxxl", forState: .Normal)
        btn.setTitleColor(UIColor.yellowColor(), forState: .Normal)
        btn.backgroundColor=UIColor.cyanColor()
        btn.layer.masksToBounds=true
        btn.layer.borderColor=UIColor.redColor().CGColor
        btn.layer.borderWidth=4
        btn.frame=CGRectMake(0, 70, 80, 20)
        return btn
    }()
    
    
}