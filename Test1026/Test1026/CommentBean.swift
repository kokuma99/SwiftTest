//
//  CommentBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/13.
//  Copyright © 2016年 kokuma. All rights reserved.
//

class CommentBean : NSObject {
    
    var  id: Int = 0
    var  type: Int = 0
    var  commentFrom: Int = 0
    var  createTime: NSData?
    var  toCommentId: Int = 0
    var  openAccountId: Int = 0
    var  examine: Int = 0
    var  report: Int = 0
    var  comment:String?
    var  appointmentId: Int = 0
    var  picture: [PictureBean]?
    var  openAccountView: OpenAccountBean?
    var  replyAccountView: OpenAccountBean?
    var  zan: Int = 0
    var  zanCount: Int = 0
    
        
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}

