//
//  VenueListController.swift
//  Test1026
//
//  Created by kokuma on 2016/12/13.
//  Copyright © 2016年 kokuma. All rights reserved.
//

//VenueListController
class VenueListController : BaseController {
    
    var listV: BaseTableView?
    
    override func prepareUI() {
        listV  = getBaseTableView(VenueCell.classForCoder(),height: LIST_ITEM_HEIGHT1_1)
        
        self.view.addSubview(listV!)
        setMatchParent(listV!, 0, 0)
    }
    
    override func loadData() {
        getVenue {
            self.listV?.data = self.data
            self.listV?.reloadData()
        }
    }
}