//
//  DynamicExtrasBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//

class DynamicExtrasBean : NSObject {
    var  id: Int = 0
    var  acgName: String?
    var  title: String?
    
    var  characterName: String?
    var  photographer: String?
  
    var dresser: String?
    var pser: String?
    var helper: String?
    var tags: String?
    var  acgId: Int = 0
    var dynamicId: Int = 0
    var  voteCode: Int = 0
    
    
    init(dict: [ String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}