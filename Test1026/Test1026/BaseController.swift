//
//  BaseColectionView.swift
//  Test1026
//
//  Created by kokuma on 2016/12/4.
//  Copyright © 2016年 kokuma. All rights reserved.
//


import UIKit
import SnapKit


typealias GetDataFinished = () -> ()
class BaseController: UIViewController {
    
    var data = [NSObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        // tableView.mj_header = setupHeaderRefresh(self, action: #selector(updateHomeData))
        loadData()
        //SVProgressHUD.show()
        // 配置JPUSH
        // (UIApplication.sharedApplication().delegate as! AppDelegate).setupJPush()
        // 注册接收推送通知的通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didReceiveRemoteNotificationOfJPush(_:)), name: JFDidReceiveRemoteNotificationOfJPush, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
      //  topScrollView?.adjustWhenControllerViewWillAppera()
    }
    
    
    /**
     准备UI
     */
    func prepareUI() {
        
        //  navigationItem.rightBarButtonItem = UIBarButtonItem.rightItem("a.jpg", highlightedImage: "b1.jpg", target: self, action: #selector(didTappedSearchButton)
    }
    

    /**
     准备UI
     */
     func loadData() {
        // NetUtils.shareNetUtils
    }
    
    func getDynamic_top(finished : GetDataFinished) {
        NetUtils.shareNetUtils.getTopicsByKeyword("",page: "1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                self.data.append(DynamicBean(dict : dict))
                // print("\(self..last?.id)")
                //  print("\(self..last?.positive)")
            }
            finished()
        }
    }
    
    func getAcg(finished : GetDataFinished) {
        NetUtils.shareNetUtils.getAcgs("1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                self.data.append(AcgBean(dict : dict))
                // print("\(self..last?.id)")
                //  print("\(self..last?.positive)")
            }
            finished()
        }
    }
    func getVenue(finished : GetDataFinished) {
        NetUtils.shareNetUtils.getVenuesByKeyword("", page: "1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                self.data.append(VenueBean(dict : dict))
                // print("\(self..last?.id)")
                //  print("\(self..last?.positive)")
            }
           finished()
        }
    }
    
    
    func getUsers(finished : GetDataFinished){
        NetUtils.shareNetUtils.getRecommendUsers("1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                self.data.append(OpenAccountBean(dict : dict))
                //  print("\(self..last?.id)")
                //    print("\(self..last?.positive)")
            }
           finished()
        }
    }
    
    func  getPersonalPlan(finished : GetDataFinished){
        var param=[String : AnyObject]()
        param["positive"] = 1
        param["page"] = 1
        param["perPage"] = 4
        
        ViewController.loadData("/personalPlan", parameters: param){(success,result,error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                   self.data.append(DynamicBean(dict: dict))
                //    print("\(self..last?.id)")
                //    print("\(self..last?.positive)")
            }
           finished()
        }
    }
    
    /**
     处理接收到的远程通知处理
     */
    func didReceiveRemoteNotificationOfJPush(notification: NSNotification) {
        // JPUSHService.resetBadge()
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
        // guard let userInfo = notification.userInfo as? [String : AnyObject] else {
        //      return
        // }
        // guard let id = userInfo["id"] as? String else {
        //     return
        // }
        
        
    }
    /**
     点击了更多按钮
     */
    // func didTappedCell_to(section: Int) {
    //     let categoryVc = JFCategoryViewController()
    //    categoryVc.category = videoCategories[section - 1]
    //   navigationController?.pushViewController(categoryVc, animated: true)


    /// 内容区域

    func  getBaseCollectionView(cellClass: AnyClass,width: Int,height: Int) -> BaseColectionView{
        let collectionV = BaseColectionView()
        collectionV.prepareUI(cellClass, width: width, height: height)
        return collectionV
    }
    
    func  getBaseTableView(cellClass: AnyClass,height: CGFloat) -> BaseTableView{
        let tableV = BaseTableView()
        tableV.prepareUI(cellClass, height: height)
        return tableV
    }
    
}
