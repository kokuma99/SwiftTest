//
//  VenueInfoBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//

class VenueInfoBean : NSObject {
    var flowLess: Int = 0
    var flowMid: Int = 0
    var flowMore: Int = 0
    var peopleBad: Int = 0
    var peopleNormal: Int = 0
    var peopleGood: Int = 0
    var hot: Int = 0
    var commentAverageScore: Int = 0
    var peopleCount: Int = 0
    
    
    
    init(dict: [ String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
