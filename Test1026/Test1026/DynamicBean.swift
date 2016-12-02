//
//  DynamicBean.swift
//  Test1026
//
//  Created by kokuma on 2016/11/30.
//  Copyright © 2016年 kokuma. All rights reserved.
//



class DynamicBean : NSObject {
    var id = 0
    
    var type: Int = 0
    
    var typeId: Int = 0
    
    var mimeType: Int = 0
    
    var url: String?
    var commentId: Int = 0
    var location: String?
    var openAccountId: Int = 0
    var replyContent: String?
    var lastReplyDynamicId: Int = 0
    var replyDynamicId: Int = 0
    var content: String?
    var zan: Int = 0
    var zanCount: Int = 0
    var positive: Int = 0
    var display: Int = 0
    var report: Int = 0
    var tranCount: Int = 0
    var commentCount: Int = 0
    var planId: Int = 0
    var venueName: String?
    
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
