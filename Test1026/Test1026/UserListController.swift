//
//  UserListController.swift
//  Test1026
//
//  Created by kokuma on 2016/12/12.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class UserListController : BaseController {
    
    var listV: BaseTableView?
    
    override func prepareUI() {
         listV  = getBaseTableView(UserCell.classForCoder(),height: AVATAR_HEIGHT*2)
         listV?.mj_header = setupHeaderRefresh(self, action: "loadData")
         listV?.mj_footer = setupFooterRefresh(self, action: #selector(loadMore))
         self.view.addSubview(listV!)
          setMatchParent(listV!, 0, 10)
    }
   
    func loadMore(){
        page++;
        loadData()
    }
    
     override func loadData() {
        if keyword == nil {
            getUsers {(success,error) in
                self.listV?.mj_footer.endRefreshing()
                self.listV?.data = self.data
                self.listV?.reloadData()
            }
            
        }else{
            getUsers2 {
                self.listV?.data = self.data
                self.listV?.reloadData()
                self.listV?.mj_footer.endRefreshing()
            }
       }
    }
}
