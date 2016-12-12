//
//  OpenAccountBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//



class OpenAccountBean : NSObject {
    var id: Int = 0
    
    var createDeviceId: String?
    
    var locale: String?
    
    var avatarUrl: String?
    
    var weiboName: String?
    
    var displayName: String?
    
    var openId: String?
    
    var mobile: String?
    
    var gender: Int = 0
    
    var birthday: String?
    
    var oauthPlateform: String?
    
    var extInfos: String?
    
    var token: String?
    
    var sex: String?
    
    var loginPwd: String?
    
    var forgerPwd: Int = 0
    
    var code: Int = 0
    
    var uid: String?
    
    var result: Int = 0
    
    var follows: Int = 0
    
    var userBackground: String?
    
    var qqOpenId: String?
    
    var acg: AcgBean?
    
    var newPwd: String?
    
    var exts: ExtBean?
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}