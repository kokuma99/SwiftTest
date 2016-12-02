//
//  HotSearchBean.swift
//  Test1026
//
//  Created by kokuma on 2016/11/30.
//  Copyright © 2016年 kokuma. All rights reserved.
//



class HotSearchBean : NSObject {
    var  id = 0
    var  keyword: String?
    var  searchCount = 0
    var  acgCount = 0
    var  venueCount = 0
    var  characterCount = 0
    var  updateTime: NSDate?
    
    
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
