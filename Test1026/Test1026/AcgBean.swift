//
//  AcgBean.swift
//  Test1026
//
//  Created by kokuma on 2016/11/30.
//  Copyright © 2016年 kokuma. All rights reserved.
//



class AcgBean : NSObject {
    var  id: Int = 0
    var  name: String?
    var  shortName: String?
    var  frontCover: String?
    var  author: String?
    var  year: Int = 0
    var  hot: Int = 0
    var  tags: String?
    var  summary: String?
    var  count: Int = 0
    var  likeCount: Int = 0
    var  collection: Int = 0
   // var c: NSDate?
    
    
    init(dict: [ String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
