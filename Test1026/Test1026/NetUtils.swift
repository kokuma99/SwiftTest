//
//  NetUtils.swift
//  Test1026
//
//  Created by kokuma on 2016/11/30.
//  Copyright © 2016年 kokuma. All rights reserved.
//


import UIKit
import Alamofire

/// 网络请求回调
typealias NetworkFinished = (success: Bool, result: JSON?, error: NSError?) -> ()

class NetUtils: NSObject {
    
    /// 网络工具类单例
    static let shareNetUtils = NetUtils()
}

// MARK: - 基础请求方法
extension NetUtils {
    
    /**
     GET请求
     
     - parameter APIString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func get(APIString: String, parameters: [String : AnyObject]?, finished: NetworkFinished) {
        
        print("\(API_BASE_URL)\(APIString)")
        Alamofire.request(.GET, "\(API_BASE_URL)\(APIString)", parameters: parameters).responseJSON { (response) -> Void in
            
            if let data = response.data {
                let json = JSON(data: data)
                // print(json)
                finished(success: true, result: json, error: nil)
            } else {
                // JFProgressHUD.showInfoWithStatus("您的网络不给力哦")
                finished(success: false, result: nil, error: response.result.error)
            }
        }
        
    }
    
    /**
     POST请求
     
     - parameter APIString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func post(APIString: String, parameters: [String : AnyObject]?, finished: NetworkFinished) {
        
        print("\(API_BASE_URL)\(APIString)")
        Alamofire.request(.POST, "\(API_BASE_URL)\(APIString)", parameters: parameters).responseJSON { (response) -> Void in
            
            if let data = response.data {
                let json = JSON(data: data)
                // print(json)
                finished(success: true, result: json, error: nil)
            } else {
                // JFProgressHUD.showInfoWithStatus("您的网络不给力哦")
                finished(success: false, result: nil, error: response.result.error)
            }
        }
    }
    
    /**
     带token的GET请求
     
     - parameter APIString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func getWithToken(APIString: String, parameters: [String : AnyObject]?, finished: NetworkFinished) {
        
        //        guard let token = JFAccountModel.shareAccount()?.token else {
        //            return
        //        }
        //
        //        print("\(API_BASE_URL)\(APIString)")
        //        Alamofire.request(.GET, "\(API_BASE_URL)\(APIString)", parameters: parameters, encoding: ParameterEncoding.URL, headers: ["Authorization" : "Bearer \(token)"]).responseJSON { (response) -> Void in
        //
        //            if let data = response.data {
        //                let json = JSON(data: data)
        //                if json["code"].intValue >= 4000 {
        //                    JFAccountModel.logout()
        //                }
        //                // print(json)
        //                finished(success: true, result: json, error: nil)
        //            } else {
        //                // JFProgressHUD.showInfoWithStatus("您的网络不给力哦")
        //                finished(success: false, result: nil, error: response.result.error)
        //            }
        //        }
        
    }
    
    /**
     带token的POST请求
     - parameter APIString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     - // Both calls are equivalent
     -Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding.default)
     -Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding(options: []))
     -// HTTP body: {"foo": [1, 2, 3], "bar": {"baz": "qux"}}
     */
    func postWithToken(APIString: String, parameters: [String : AnyObject]?, finished: NetworkFinished) {
        
        //        guard let token = JFAccountModel.shareAccount()?.token else {
        //            return
        //        }
        //
        //        print("\(API_BASE_URL)\(APIString)")
        //        Alamofire.request(.POST, "\(API_BASE_URL)\(APIString)", parameters: parameters, encoding: ParameterEncoding.JSON, headers: ["Authorization" : "Bearer \(token)"]).responseJSON { (response) -> Void in
        //
        //            if let data = response.data {
        //                let json = JSON(data: data)
        //                if json["code"].intValue >= 4000 {
        //                    JFAccountModel.logout()
        //                }
        //                //                 print(json)
        //                finished(success: true, result: json, error: nil)
        //            } else {
        //                // JFProgressHUD.showInfoWithStatus("您的网络不给力哦")
        //                finished(success: false, result: nil, error: response.result.error)
        //            }
        //        }
        //
    }
}

// MARK: - 抽取业务请求 - 需要token验证
extension NetUtils {
    
    //获取推荐的用户(探索ExploreFragment，未登录)
    func getRecommendUsers( page:String,finished: NetworkFinished) {//openAccountId也可以设置
        let parameters: [String : AnyObject] = [
            "page" : page,
            "perPage" : 8
        ]
        get(RECOMS, parameters: parameters, finished: finished)
    }
    
    //获取漫圈所有数据(HotCos2Fragment)//keyword 可以设为""
    func getAcgs( page: String, keyword: String, finished: NetworkFinished){
        let parameters: [String : AnyObject] = [
            "page" : page,
            "perPage" : 10,
            "keyword" : keyword
        ]
        get(ACGS, parameters: parameters, finished: finished)
    }
    
    //获取某个acg详情数据(AcgcosDetailActivity)//openAccountId, 可以设置Authorization也可以不设置
    func getOneAcg(id: String, finished: NetworkFinished){
        //let parameters: [String : AnyObject] = [
        //       "openAccountId" : openAccountId,
        //]
        get("\(ACGS_ONE)\(id)", parameters: nil, finished: finished)
    }
    
    
   // 搜索
    //获取用户列表()
    func  getUsersByKeyword(keyword: String,page: String,finished: NetworkFinished){//openAccountId可选
        let parameters: [String : AnyObject] = [
            "page" : page,
            "perPage" : 10,
            "keyword" : keyword
        ]
        get(ACCOUNTS_SEARCH, parameters: parameters, finished: finished)
    }
    
    //获取某个用户详情数据(AcgcosDetailActivity)//openAccountId可选, 不需要Authorization
    func getOneUser(id: String, finished: NetworkFinished){
        //let parameters: [String : AnyObject] = [
        //       "openAccountId" : openAccountId,
        //]
        get("\(ACCOUNTS_ONE)\(id)", parameters: nil, finished: finished)
    }
    
    //获取Acg列表()
    func  getAcgsByKeyword(keyword: String,page: String, finished: NetworkFinished){
        let parameters: [String : AnyObject] = [
            "page" : page,
            "perPage" : 10,
            "keyword" : keyword
        ]
        get(ACGS, parameters: parameters, finished: finished)
    }
    
    
    //获取场地列表()//可选"orderHot", "1"   "orderBy", "distance"  "lat", string_lat  "lng", string_lng  "city", string_city
    func  getVenuesByKeyword(keyword: String, page: String,finished: NetworkFinished){
        let parameters: [String : AnyObject] = [
            "page" : page,
            "perPage" : 10,
            "keyword" : keyword
        ]
        get(VENUES, parameters: parameters, finished: finished)
    }
    
    //获取某个场地详情数据(AcgcosDetailActivity)//Authorization可选
    func getOneVenue(id: String, finished: NetworkFinished){
        let parameters: [String : AnyObject] = [
            "byComment": "1"
        ]
        get("\(VENUES_ONE)\(id)", parameters: parameters, finished: finished)
    }
    
    //可选accountId
    func  getTopicsByKeyword(keyword: String, page: String,finished: NetworkFinished){
        let parameters: [String : AnyObject] = [
            "page" : page,
            "perPage" : 6,
            "keyword" : keyword,
            "positive": "4"
        ]
        get(DYNAMICS, parameters: parameters, finished: finished)
    }
    
    //获取某个专题详情数据(TopicDetailActivity)//openAccountId可选，无Authorization
    func getOneTopic(id: String, finished: NetworkFinished){
        
        get("\(DYNAMICS_ONE)\(id)", parameters: nil, finished: finished)
    }
    
    //获取COS正片列表()//accountId可选，无Authorization
    func  getCosWorksByKeyword(keyword: String, page: String,finished: NetworkFinished){
        let parameters: [String : AnyObject] = [
            "page" : page,
            "perPage" : 8,
            "keyword" : keyword,
            "positive": "1"
        ]
        get(DYNAMICS, parameters: parameters, finished: finished)
    }
    
    
    //获取某个Cos作品详情数据(PositiveWorkActivity)//openAccountId可选，无Authorization
    func getOneCosWork(id: String, finished: NetworkFinished){
        
        get("\(DYNAMICS_ONE)\(id)", parameters: nil, finished: finished)
    }
    
    
    
    
    
    
    
    /**
     发布动弹
     
     - parameter APIString: urlString
     - parameter text:      文字内容
     - parameter images:    图片     [UIimage]?
     - parameter atUsers:   被at用户 [[id : AnyObject, nickname : AnyObject]]?
     - parameter finished:  完成回调
     */
    func sendTweets(text: String, images: [UIImage]?, atUsers: [[String : AnyObject]]?, finished: NetworkFinished) {
        
        var parameters = [String : AnyObject]()
        // parameters["user_id"] = JFAccountModel.shareAccount()!.id;
        parameters["content"] = text;
        
        // 图片
        if let images = images where images.count > 0 {
            var imageBase64s = [String]()
            for image in images {
                let imageData = UIImageJPEGRepresentation(image, 1)!
                let imageBase64 = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue:0))
                imageBase64s.append(imageBase64)
            }
            
            if let json = objectToJson(imageBase64s) {
                parameters["photos"] = json
            }
        }
        
        // 被at用户
        if let atUsers = atUsers where atUsers.count > 0 {
            if let json = objectToJson(atUsers) {
                parameters["atUsers"] = json
            }
        }
        
        print(parameters)
        //  postWithToken(POST_TWEETS, parameters: parameters, finished: finished)
    }
    
    /**
     添加或删除赞记录
     
     - parameter type:      赞的类型 video_info / tweet
     - parameter sourceID:  视频信息或动弹的id
     - parameter finished:  完成回调
     */
    func addOrCancelLikeRecord(type: String, sourceID: Int, finished: NetworkFinished) {
        //
        //        let parameters: [String : AnyObject] = [
        //            "user_id" : JFAccountModel.shareAccount()!.id,
        //            "type" : type,
        //            "source_id" : sourceID
        //        ]
        //
        //        postWithToken(ADD_OR_CANCEL_LIKE_RECORD, parameters: parameters, finished: finished)
    }
    
    /**
     添加或删除收藏
     
     - parameter VideoInfoId: 视频信息id
     - parameter finished:    完成回调
     */
    func addOrCancelCollection(videoInfoId: Int, finished: NetworkFinished) {
        
        //        let parameters: [String : AnyObject] = [
        //            "user_id" : JFAccountModel.shareAccount()!.id,
        //            "video_info_id" : videoInfoId
        //        ]
        //
        //        postWithToken(ADD_OR_CANCEL_COLLECTION, parameters: parameters, finished: finished)
    }
    
    /**
     添加或删除朋友
     
     - parameter relationUserId: 要发生关系用户的id
     - parameter finished:       完成回调
     */
    func addOrCancelFriend(relationUserId: Int, finished: NetworkFinished) {
        
        //        let parameters: [String : AnyObject] = [
        //            "user_id" : JFAccountModel.shareAccount()!.id,
        //            "relation_user_id" : relationUserId
        //        ]
        //
        //        postWithToken(ADD_OR_CANCEL_FRIEND, parameters: parameters, finished: finished)
    }
    
}

// MARK: - 抽取业务请求 - 免验证
extension NetUtils {
    
    /**
     提交反馈信息
     
     - parameter contact:  联系方式
     - parameter content:  反馈内容
     - parameter finished: 完成回调
     */
    func postFeedback(contact: String, content: String, finished: NetworkFinished) {
        
        let parameters: [String : AnyObject] = [
            "contact" : contact,
            "content" : content
        ]
        
        //  post(POST_FEEDBACK, parameters: parameters, finished: finished)
    }
    
    /**
     获取播放节点
     
     - parameter finished: 完成回调
     */
    func getPlayNode(finished: NetworkFinished) {
        //  get(GET_PALY_NODE, parameters: nil, finished: finished)
    }
}

// MARK: - 辅助方法
extension NetUtils {
    
    /**
     对象转json
     */
    private func objectToJson(object: AnyObject) -> NSString? {
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(object, options: NSJSONWritingOptions.PrettyPrinted)
            return NSString(data: data, encoding: NSUTF8StringEncoding)
        } catch {
            return nil
        }
    }
    
    /**
     获取当前网络状态
     
     - returns: 0未知 1WiFi 2WAN
     */
    func getCurrentNetworkState() -> Int {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.networkState
    }
}
