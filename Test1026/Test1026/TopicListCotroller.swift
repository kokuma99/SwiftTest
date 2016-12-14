//
//  TopicListCotroller.swift
//  Test1026
//
//  Created by kokuma on 2016/12/13.
//  Copyright © 2016年 kokuma. All rights reserved.
//

//TopicListCotroller
class TopicListCotroller : BaseController {
    
    var listV: BaseTableView?
    
    override func prepareUI() {
        listV  = getBaseTableView(TopicCell.classForCoder(),height: LIST_ITEM_HEIGHT1_2)
        
        self.view.addSubview(listV!)
        setMatchParent(listV!, 0, 0)
    }
    
    override func loadData() {
        getDynamic_top {
            self.listV?.data = self.data
            self.listV?.reloadData()
        }
    }
}
