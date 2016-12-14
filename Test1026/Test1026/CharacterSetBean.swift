//
//  CharacterSetBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/13.
//  Copyright © 2016年 kokuma. All rights reserved.
//


class CharacterSetBean : NSObject {
    var id: Int = 0
    
    var acgFrom: Int = 0
    
    var acgName: String?
    
    var characters: [String]?
    var createBy: Int = 0
    var picture: [String]?
    var openAccountView: OpenAccountBean?
    var picCount: Int = 0
    var planId: Int = 0

    var collection: Int = 0
    var readCount: Int = 0
    var favoriteCount: Int = 0
    
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
