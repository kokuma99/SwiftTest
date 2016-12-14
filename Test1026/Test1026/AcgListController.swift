//
//  AcgListController.swift
//  Test1026
//
//  Created by kokuma on 2016/12/13.
//  Copyright © 2016年 kokuma. All rights reserved.
//


import UIKit

class AcgListController : BaseController {
    
    var listV: BaseTableView?
    
    override func prepareUI() {
        listV  = getBaseTableView(AcgCell.classForCoder(),height: AVATAR_HEIGHT*2)
        
        self.view.addSubview(listV!)
        setMatchParent(listV!, 0, 10)
    }
    
    override func loadData() {
        getAcg {
            self.listV?.data = self.data
            self.listV?.reloadData()
        }
    }
}