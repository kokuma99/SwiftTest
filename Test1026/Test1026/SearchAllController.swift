//
//  SearchAllController.swift
//  Test1026
//
//  Created by kokuma on 2016/12/24.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit
import SnapKit

class SearchAllController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        // tableView.mj_header = setupHeaderRefresh(self, action: #selector(updateHomeData))
        loadData()
        //SVProgressHUD.show()
        
       }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        //  topScrollView?.adjustWhenControllerViewWillAppera()
    }
    
    
    /**
     准备UI
     */
    func prepareUI() {
        view.addSubview(scrollBar)
        view.addSubview(pageScrollContainer)
        scrollBar.backgroundColor = RED
        scrollBar.snp_makeConstraints { (make) in
            make.top.equalTo(60)
            make.left.equalTo(0)
            make.right.equalTo(0)
          //  make.width.equalTo(100)
            make.height.equalTo(60)
        }
        setMatchParent(pageScrollContainer,  125, 0)
        scrollBar.contentScrollView = pageScrollContainer
        let childs  = [UserListController(),AcgListController(),VenueListController(),TopicListCotroller(),MyProfileController()]
//        for c in childs {
//            addChildViewController(c)
//        }
        pageScrollContainer.setupUI(scrollBar, childs)
    }

    /**
     准备UI
     */
    func loadData() {
        // NetUtils.shareNetUtils
    }
    

    lazy var scrollBar: ScrollTabView = ScrollTabView()
    lazy var pageScrollContainer: PageScrollView = PageScrollView()

}

