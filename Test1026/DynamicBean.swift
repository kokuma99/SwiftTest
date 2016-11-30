//
//  DynamicBean.swift
//  Test1026
//
//  Created by kokuma on 2016/11/30.
//  Copyright © 2016年 kokuma. All rights reserved.
//



class DynamicBean : NSObject {
    var id = 0
    
    var title: String?
    
    var content: String?
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}