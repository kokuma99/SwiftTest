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
          self.view.addSubview(listV!)
          setMatchParent(listV!, 0, 10)
    }
   
     override func loadData() {
        if keyword == nil {
            getUsers {
                self.listV?.data = self.data
                self.listV?.reloadData()
            }
            
        }else{
            getUsers2 {
                self.listV?.data = self.data
                self.listV?.reloadData()
            }
       }
    }
}
