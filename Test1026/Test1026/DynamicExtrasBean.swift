//
//  DynamicExtrasBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//

class DynamicExtrasBean : NSObject {
    var  id: Int = 0
    var  name: String?
    var  tags: AnyObject?
    
    var  city: String?
    var  district: String?
    var  type: Int = 0
    
    var  contact: String?
    var  openTime: String?
    var  addr: String?
    var  cost: Int = 0
    //var  description: String?
    var  images: AnyObject?
    var picCount: Int = 0
    var creatorAvatarUrl: String?
    var costSummary: String?
    var cover: String?
    var error: String?
    var  follow: Int = 0
    
    var  creatorId: Int = 0
    
    
    init(dict: [ String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}