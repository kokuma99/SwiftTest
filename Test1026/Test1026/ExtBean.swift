//
//  ExtBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//

class ExtBean : NSObject {
    var skillCoser: Bool = false
    var skillShoter: Bool?
    var skillMashuper: Bool?
    var skillTooler: Bool?
    var skillPser: Bool?
    var skillHelper: Bool?
    var skillScripter: Bool?
    var dateCosstart: NSDate?
    var viewer: Bool?
    
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}