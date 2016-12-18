//  BaseTabBarController.swift
//  Test1026
//
//  Created by kokuma on 2016/12/4.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = JFTabBar()
        tabBar.tabBarDelegate = self
        setValue(tabBar, forKey: "tabBar")
        // tabBar.tintColor = COLOR_NAV_BG
        prepareVc()
    }
    
    func prepareVc() {
        
        let newVc1 = UserListController()
        configChildViewController(newVc1, title: "探索", imageName: "tab_explore_n", selectedImageName: "tab_explore_h")
        
        let newVc2 = AcgListController()
        configChildViewController(newVc2, title: "分类", imageName: "tab_classify_n", selectedImageName: "tab_classify_h")
        
        let newVc3 = VenueListController()
        configChildViewController(newVc3, title: "消息", imageName: "tab_msg_n", selectedImageName: "tab_msg_h")
        
        let newVc4 = MyProfileController()
        configChildViewController(newVc4, title: "我的", imageName: "tab_mine_n", selectedImageName: "tab_mine_h")
        
        // 布局完立马选中，防止崩溃
        selectedIndex = 0
    }
    
    /**
     配置TabBarController的子控制器
     
     - parameter childViewController: 子控制器
     - parameter title:               标题
     - parameter imageName:           默认图片名
     - parameter selectedImageName:   选中图片名
     */
    func configChildViewController(childViewController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        childViewController.title = title
        childViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        childViewController.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: UIControlState.Normal)
        childViewController.tabBarItem.image = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysOriginal)
        childViewController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.imageWithRenderingMode(.AlwaysOriginal)
        let navigationC = UINavigationController(rootViewController: childViewController)
        addChildViewController(navigationC)
    }
    
    /**
     哪些控制器可以进行旋转
     */
    override func shouldAutorotate() -> Bool {
        //  guard let nav = self.viewControllers?[self.selectedIndex] as? JFNavigationController else {
        //      return false
        // }
        
     //   guard let topVc = navigationController!.topViewController else {
        //    return false
       // }
        
        // if topVc.isKindOfClass(JFPlayerViewController.classForCoder()) {
        //    return true
        // }
        
        // if topVc.isKindOfClass(JFWebPlayerViewController.classForCoder()) {
        //     return true
        //  }
        
        return false
    }
    
    /**
     支持哪些方向的旋转
     */
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        //  guard let nav = self.viewControllers?[self.selectedIndex] as? JFNavigationController else {
        //      return UIInterfaceOrientationMask.Portrait
        //  }
      //  guard let topVc = nav.topViewController else {
      //      return UIInterfaceOrientationMask.Portrait
        //}
        
        //  if topVc.isKindOfClass(JFPlayerViewController.classForCoder()) {
        //      return [UIInterfaceOrientationMask.Portrait, UIInterfaceOrientationMask.LandscapeLeft, UIInterfaceOrientationMask.LandscapeRight]
        //  }
        
        //  if topVc.isKindOfClass(JFWebPlayerViewController.classForCoder()) {
        //     return [UIInterfaceOrientationMask.LandscapeLeft, UIInterfaceOrientationMask.LandscapeRight]
        //  }
        
        return UIInterfaceOrientationMask.Portrait
    }
    
}

// MARK: - JFTabBarDelegate
extension BaseTabBarController: JFTabBarDelegate {
    
    /**
     点击了发布按钮
     */
    func didTappedAddButton() {
        
          let publishVc = UINavigationController(rootViewController: LoginController())
        //  let loginVc = JFNavigationController(rootViewController: JFLoginViewController(nibName: "JFLoginViewController", bundle: nil))
        //  let vc = JFAccountModel.isLogin() ? publishVc : loginVc
         presentViewController(publishVc, animated: true, completion: nil)
    }
}


