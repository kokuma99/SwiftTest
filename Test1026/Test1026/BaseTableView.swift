//
//  BaseTableView.swift
//  Test1026
//
//  Created by kokuma on 2016/12/11.
//  Copyright © 2016年 kokuma. All rights reserved.
//


import UIKit

class BaseTableView: UITableView {
    
    /// 动弹模型数组
    var data : NSArray?
    
    /// 动弹列表cell重用标识
    let dataIdentifier = "dataIdentifier"
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("has not been implemented")
    }
    
    internal func prepareUI(cellClass: AnyClass,height: CGFloat){
        // let header = MJRefreshHeader()
        self.backgroundColor=UIColor.greenColor()
        self.rowHeight=height
        self.dataSource=self
        self.delegate=self
        registerClass(cellClass, forCellReuseIdentifier: dataIdentifier)
    }
}

extension BaseTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data==nil ? 0 : data!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(dataIdentifier) as! BaseTableCell
        cell.data = data![indexPath.row] as! NSObject
        return cell
    }
}