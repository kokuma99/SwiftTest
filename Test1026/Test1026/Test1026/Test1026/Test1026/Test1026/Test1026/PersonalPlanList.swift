//
//  PersonalPlanList.swift
//  Test1026
//
//  Created by kokuma on 2016/11/8.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class PersonalPlanList: UITableView {
    
    /// 动弹模型数组
    var grammars: [String] = ["nima","kengdie"]
    /// 动弹列表cell重用标识
    let grammarIdentifier = "grammarIdentifier"
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("has not been implemented")
    }
    
     internal func prepareUI(){
        self.backgroundColor=UIColor.greenColor()
        self.rowHeight=200
        self.dataSource=self
        self.delegate=self
        registerClass(ImgWithTxtView.classForCoder(), forCellReuseIdentifier: grammarIdentifier)
    }
}

extension PersonalPlanList: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grammars.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(grammarIdentifier) as! ImgWithTxtView
        cell.grammar = grammars[indexPath.row]
        return cell
    }
    }