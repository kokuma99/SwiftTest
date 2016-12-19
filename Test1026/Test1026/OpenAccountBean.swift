//
//  OpenAccountBean.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//



class OpenAccountBean : NSObject, NSCoding {
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
    
    // 保存到内存中
    private static var userAccount: OpenAccountBean?
    
    
    
    
    // MARK: - 归档和解档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(token, forKey: "token")
        aCoder.encodeInt(Int32(id), forKey: "id")
        aCoder.encodeObject(displayName, forKey: "displayName")
       // aCoder.encodeObject(registerTime, forKey: "registerTime")
       // aCoder.encodeObject(email, forKey: "email")
        aCoder.encodeObject(avatarUrl, forKey: "avatarUrl")
    }
    
    /** 注销 */
    class func logout() -> Void {
    
    // 清除内存中的账号对象和归档 
    OpenAccountBean.userAccount = nil
        do {
            try NSFileManager.defaultManager().removeItemAtPath(OpenAccountBean.accountPath) } catch { print("退出异常") }
    }
    
    /** 登录 */
    func updateUserInfo() -> Void {
        // 保存到内存中
        OpenAccountBean.userAccount = self
        // 归档用户信息 
        saveAccount()
    }
    
    static func shareAccount() -> OpenAccountBean? {
        if userAccount == nil {
            userAccount = NSKeyedUnarchiver.unarchiveObjectWithFile(accountPath) as? OpenAccountBean
        }
        if userAccount == nil {
            // 说明没有登录 
            return nil } else {
            // 这里还需要验证账号是否有效 
            return userAccount }
        }
    
    /// 归档账号的路径
    static let accountPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/OpenAccountBean.plist"
    // MARK: - 保存对象
    func saveAccount() { NSKeyedArchiver.archiveRootObject(self, toFile: OpenAccountBean.accountPath) }
        
    required init?(coder aDecoder: NSCoder) {
        token = aDecoder.decodeObjectForKey("token") as? String
        id = Int(aDecoder.decodeIntForKey("id"))
        displayName = aDecoder.decodeObjectForKey("displayName") as? String
        //registerTime = aDecoder.decodeObjectForKey("registerTime") as? String
       // email = aDecoder.decodeObjectForKey("email") as? String
        avatarUrl = aDecoder.decodeObjectForKey("avatarUrl") as? String
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}