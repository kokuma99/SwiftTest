//
//  BaseColectionView.swift
//  Test1026
//
//  Created by kokuma on 2016/12/4.
//  Copyright © 2016年 kokuma. All rights reserved.
//


import UIKit
import SnapKit

class BaseController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        // tableView.mj_header = setupHeaderRefresh(self, action: #selector(updateHomeData))
        loadData()
        
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
        
      //  navigationItem.rightBarButtonItem = UIBarButtonItem.rightItem("a.jpg", highlightedImage: "b1.jpg", target: self, action: #selector(didTappedSearchButton))
    }
    
    /**
     准备UI
     */
    func loadData() {
        // NetUtils.shareNetUtils
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
lazy var mainView: UIView = {
    let mainView = UIView()
    
    
    return mainView
}()
}
