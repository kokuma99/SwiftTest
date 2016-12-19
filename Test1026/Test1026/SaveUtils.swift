//
//  SaveUtils.swift
//  Test1026
//
//  Created by kokuma on 2016/12/19.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import Foundation


//存普通的数据类型
func saveObj(value: AnyObject?,_ forKey: String){
    NSUserDefaults.standardUserDefaults().setObject(value, forKey: forKey)
}

//获取NSData
func dataForKey(defaultName: String) -> NSData?{
  return  NSUserDefaults.standardUserDefaults().dataForKey(defaultName)
}

//获取Bool
func boolForKey(defaultName: String) -> Bool{
    return  NSUserDefaults.standardUserDefaults().boolForKey(defaultName)
}

//获取Int
func integerForKey(defaultName: String) -> Int{
    return  NSUserDefaults.standardUserDefaults().integerForKey(defaultName)
}

//获取String
func stringForKey(defaultName: String) -> String?{
    return  NSUserDefaults.standardUserDefaults().stringForKey(defaultName)
}

//获取数组array
func arrayForKey(defaultName: String) -> [AnyObject]?{
    return  NSUserDefaults.standardUserDefaults().arrayForKey(defaultName)
}

//获取dictionary
func dictionaryForKey(defaultName: String) -> [String : AnyObject]?{
    return  NSUserDefaults.standardUserDefaults().dictionaryForKey(defaultName)
}

//归档方式存储，最好用类名表示
func savePlist(rootObject: AnyObject,plistName: String){
    /// 归档账号的路径
     let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/\(plistName).plist"
    // MARK: - 保存对象
    NSKeyedArchiver.archiveRootObject(rootObject, toFile: path)
    
}

//查询plist文件
func getPlist(plistName: String) -> AnyObject?{
    /// 归档账号的路径
    let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/\(plistName).plist"
    return NSKeyedUnarchiver.unarchiveObjectWithFile(path)
}

//删除plist文件
func deletePlist(plistName: String){
    /// 归档账号的路径
    let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/\(plistName).plist"
    do {
        try NSFileManager.defaultManager().removeItemAtPath(path)
    } catch {
        print("deletePlist异常")
    }
}











