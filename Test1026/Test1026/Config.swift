//
//  Config.swift
//  BaiSiBuDeJie-swift
//
//  Created by zhoujianfeng on 16/7/16.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

import UIKit
//import MJRefresh
//import pop
//import SwiftyJSON

let SCREEN_BOUNDS = UIScreen.mainScreen().bounds
let SCREEN_WIDTH = SCREEN_BOUNDS.width
let SCREEN_HEIGHT = SCREEN_BOUNDS.height

/// 全局边距
let MARGIN: CGFloat = 12

/// 全局圆角
let CORNER_RADIUS: CGFloat = 5

/// 全局遮罩透明度
let GLOBAL_SHADOW_ALPHA: CGFloat = 0.5

/// 视频列表的item的间距
let LIST_ITEM_PADDING: CGFloat = 6

/// item宽度，1列
let LIST_ITEM_WIDTH1: CGFloat = ((SCREEN_WIDTH - 2 * 10) / 2)

/// item宽度，2列
let LIST_ITEM_WIDTH2: CGFloat = ((SCREEN_WIDTH - 3 * 10) / 2)

/// item宽度，3列
let LIST_ITEM_WIDTH3: CGFloat = ((SCREEN_WIDTH - 4 * 10) / 3)

/// item的高度，1列,android 200dp,地点
let LIST_ITEM_HEIGHT1_1: CGFloat = (SCREEN_HEIGHT * 0.37)

/// item的高度，1列,android 156dp，
let LIST_ITEM_HEIGHT1_2: CGFloat = (SCREEN_HEIGHT * 0.29)

/// item的高度，2列
let LIST_ITEM_HEIGHT2_1: CGFloat = LIST_ITEM_WIDTH2

/// item的高度，2列
let LIST_ITEM_HEIGHT2_2: CGFloat = (266 / 1080 * SCREEN_HEIGHT)

/// item的高度，2列
let LIST_ITEM_HEIGHT2_3: CGFloat = (LIST_ITEM_WIDTH2 / 16 * 9 + 58)

/// item的高度，3列
let LIST_ITEM_HEIGHT3_1: CGFloat = LIST_ITEM_WIDTH3

/// item的高度，3列
let LIST_ITEM_HEIGHT3_2: CGFloat =  (140 / 1080 * SCREEN_HEIGHT)

/// 导航栏背景色 - 绿色
let COLOR_NAV_BG = UIColor.colorWithHexString("41ca61")

/// 所有控制器背景颜色 - 偏白
let COLOR_ALL_BG = UIColor.colorWithHexString("f7f7f7")

/// cell按下的颜色
let COLOR_ALL_CELL_HIGH = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)

/// cell默认颜色
let COLOR_ALL_CELL_NORMAL = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.00)

/// 分割线颜色
let COLOR_ALL_CELL_SEPARATOR = RGB(0.3, g: 0.3, b: 0.3, alpha: 0.1)

/// 导航栏ITEM默认 - 白色
let COLOR_NAV_ITEM_NORMAL = UIColor(red:0.95, green:0.98, blue:1.00, alpha:1.00)

/// 导航栏ITEM高亮 - 偏白
let COLOR_NAV_ITEM_HIGH = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)

let DEFAULT_UI_BG = UIColor.colorWithHexString("f0f0f0")

let RED = UIColor.colorWithHexString("f47c8d")

/// 是否允许蜂窝网播放视频
let KEY_ALLOW_CELLULAR_PLAY = "KEY_ALLOW_CELLULAR_PLAY"

/// 是否允许蜂窝网下载视频
let KEY_ALLOW_CELLULAR_DOWNLOAD = "KEY_ALLOW_CELLULAR_DOWNLOAD"

/// 原生广告id
let NATIVE_UNIT_ID = "ca-app-pub-3941303619697740/7991657719"

/// 插页广告id
let INTERSTITIAL_UNIT_ID = "ca-app-pub-3941303619697740/5655470113"

/// 横幅广告id
let BANNER_UNIT_ID = "ca-app-pub-3941303619697740/4039136115"

/// 播放节点，默认是app播放
var PLAY_NODE = "app"

/// m3u8存放根目录
let DOWNLOAD_PATH = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/DownloadVideos/"

/// 首页分类json缓存文件路径
let CATEGORIES_JSON_PATH = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/categories.json"

/// 首页banner json缓存文件路径
let BANNER_JSON_PATH = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/banner.json"

/**
 手机型号枚举
 */
enum iPhoneModel {
    
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6p
    case iPad
    
    /**
     获取当前手机型号
     
     - returns: 返回手机型号枚举
     */
    static func getCurrentModel() -> iPhoneModel {
        switch SCREEN_HEIGHT {
        case 480:
            return .iPhone4
        case 568:
            return .iPhone5
        case 667:
            return .iPhone6
        case 736:
            return .iPhone6p
        default:
            return .iPad
        }
    }
}

/**
 RGB颜色构造
 */
func RGB(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}

/**
 给控件添加弹簧动画
 */
func setupButtonSpringAnimation(view: UIView) {
//    let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
//    sprintAnimation.fromValue = NSValue(CGPoint: CGPoint(x: 0.8, y: 0.8))
//    sprintAnimation.toValue = NSValue(CGPoint: CGPoint(x: 1, y: 1))
//    sprintAnimation.velocity = NSValue(CGPoint: CGPoint(x: 30, y: 30))
//    sprintAnimation.springBounciness = 20
//    view.pop_addAnimation(sprintAnimation, forKey: "springAnimation")
}

/**
 快速创建上拉加载更多控件
 */
//func setupFooterRefresh(target: AnyObject, action: Selector) -> MJRefreshFooter {
//    let footerRefresh = MJRefreshBackNormalFooter(refreshingTarget: target, refreshingAction: action)
//    footerRefresh.automaticallyHidden = true
//    footerRefresh.setTitle("正在加载", forState: MJRefreshState.Refreshing)
//    footerRefresh.setTitle("可以松开了", forState: MJRefreshState.Pulling)
//    footerRefresh.setTitle("上拉加载更多", forState: MJRefreshState.Idle)
//    footerRefresh.setTitle("没有啦~~~", forState: MJRefreshState.NoMoreData)
//    return footerRefresh
//}

/**
 快速创建下拉加载最新控件
 */
//func setupHeaderRefresh(target: AnyObject, action: Selector) -> MJRefreshNormalHeader {
//    let headerRefresh = MJRefreshNormalHeader(refreshingTarget: target, refreshingAction: action)
//    headerRefresh.lastUpdatedTimeLabel.hidden = true
//    headerRefresh.stateLabel.hidden = true
//    return headerRefresh
//}

/**
 判断是否登录，如果没有登录则跳转到登录界面
 
 - parameter controller: 当前控制器
 
 - returns: 是否已经登录
 */
func isLogin(controller: UIViewController) -> Bool {
    
        return false
    
}

/**
 缓存json数据为指定json文件
 
 - parameter json:     JSON对象
 - parameter jsonPath: json文件路径
 */
func saveJson(json: JSON, jsonPath: String) {
    do {
        if let json = json.rawString() {
            try json.writeToFile(jsonPath, atomically: true, encoding: NSUTF8StringEncoding)
            print("缓存数据成功", jsonPath)
        }
    } catch {
        print("缓存数据失败", jsonPath)
    }
}

/**
 删除指定文件
 
 - parameter jsonPath: 要删除的json文件路径
 */
func removeJson(jsonPath: String) {
    let fileManager = NSFileManager.defaultManager()
    if fileManager.fileExistsAtPath(jsonPath) {
        do {
            try fileManager.removeItemAtPath(jsonPath)
            print("删除成功", jsonPath)
        } catch {
            print("删除失败", jsonPath)
        }
    }
}

/**
 获取缓存的json数据
 
 - parameter jsonPath: json文件路径
 
 - returns: JSON对象
 */
func getJson(jsonPath: String) -> JSON? {
    if let data = NSData(contentsOfFile: jsonPath) {
        print("获取缓存数据成功", jsonPath)
        let json = JSON(data: data)
        return json
    }
    print("获取缓存数据失败", jsonPath)
    return nil
}

/// 远程推送通知的处理通知
let JFDidReceiveRemoteNotificationOfJPush = "JFDidReceiveRemoteNotificationOfJPush"

/// 应用id
let APPLE_ID = "1146271758"

/// shareSDK
let SHARESDK_APP_KEY = "1653cf104db38"
let SHARESDK_APP_SECRET = "6b00b63749f0163ac7aa5c7f4ff1032c"

/// 微信
let WX_APP_ID = "wx4a14474f61b01bfc"
let WX_APP_SECRET = "a227f7cc0874b63fba823ad4e66f0035"

/// QQ
let QQ_APP_ID = "1105560051"
let QQ_APP_KEY = "LmKVtYNVHhpLMwJw"

/// 微博
let WB_APP_KEY = "2001799644"
let WB_APP_SECRET = "cead655a91ca9ed0f9ad0a2b9dd7b4a1"
let WB_REDIRECT_URL = "https://blog.6ag.cn"

/// 极光推送
let JPUSH_APP_KEY = "1d918a27ec1db14f243a79cf"
let JPUSH_MASTER_SECRET = "9b9d4eda4d09b413e8159499"
let JPUSH_CHANNEL = "Publish channel"
let JPUSH_IS_PRODUCTION = true
