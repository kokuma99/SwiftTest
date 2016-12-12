//
//  PictureBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//


class PictureBean : NSObject {
    var id: Int = 0
    
    var venueId: Int = 0
    
    var planId: Int = 0
    
    var commentId: Int = 0
    
    var picUrl: String?
    
    var creator: Int = 0
    
    var newCommentId: Int = 0
    
    var dynamicId: Int = 0
    
    var likeCount: Int = 0
    
    var like: Int = 0
    
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
