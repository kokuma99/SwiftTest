//
//  TestScrollController.swift
//  Test1026
//
//  Created by kokuma on 2017/1/2.
//  Copyright © 2017年 kokuma. All rights reserved.
//

import UIKit
import SnapKit

class TestScrollController: UIViewController {
    var heightTable : Int = 0
var data = [NSObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        prepareUI()
        setBackButton()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        //  topScrollView?.adjustWhenControllerViewWillAppera()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(heightTable==0){
             collapsingView.contentSize = CGSize(width: 0, height: 1290)
        }else {
             collapsingView.contentSize = CGSize(width: 0, height: heightTable + 200)
        }
        
    }
    
    func prepareUI() {
        view.addSubview(collapsingView)
        collapsingView.bottomView.addSubview(bottomTable)
        self.collapsingView.addSubview(bottomTable)
        bottomTable.scrollEnabled = false
        let heightTable = data.count
//       bottomTable.snp_makeConstraints { (make) in
//        make.top.equalTo(200)
//        make.left.equalTo(0)
//        make.height.equalTo(NSInteger(LIST_ITEM_HEIGHT1_1)*heightTable)
//        make.width.equalTo(SCREEN_WIDTH)
//        }
         //setMatchParent(collapsingView, 0, 0)
        self.automaticallyAdjustsScrollViewInsets = false
        loadData()
    }
    
    func loadData() {
        getVenue {
            self.bottomTable.data = self.data
            self.bottomTable.reloadData()
             self.heightTable = self.data.count*NSInteger(LIST_ITEM_HEIGHT1_1)
            print("heightTable-\(self.heightTable)")
            self.bottomTable.snp_makeConstraints { (make) in
                make.top.equalTo(200)
                make.left.equalTo(0)
                make.height.equalTo(self.heightTable)
                make.width.equalTo(SCREEN_WIDTH)
            }
            if(self.heightTable==0){
                self.collapsingView.contentSize = CGSize(width: 0, height: 1290)
            }else {
                self.collapsingView.contentSize = CGSize(width: 0, height: self.heightTable + 200)
            }

            
        }
    }
    
    func getVenue(finished : GetDataFinished) {
        let key = ""
        NetUtils.shareNetUtils.getVenuesByKeyword(key, page: "1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                self.data.append(VenueBean(dict : dict))
                // print("\(self..last?.id)")
                //  print("\(self..last?.positive)")
            }
            finished()
        }
    }
    
    lazy var collapsingView: CollapsingScrollView = {
           var v = CollapsingScrollView()
        v.frame = CGRect(x: 0, y: 66, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-66)
        v.backgroundColor = UIColor.brownColor()
        return v
    }()
    
    lazy var bottomTable : BaseTableView = {
        var view = BaseTableView()
        view.prepareUI(VenueCell.classForCoder(),height: LIST_ITEM_HEIGHT1_1)
        view.backgroundColor = UIColor.purpleColor()
        return view
    }()
    
    
    //添加返回事件
    func setBackButton(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "left_back_gray"), style: .Done, target: self, action: "back2")
    }
    
    //返回事件
    func back2() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
