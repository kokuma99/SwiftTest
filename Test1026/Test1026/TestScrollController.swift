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

    override func viewDidLoad() {
        super.viewDidLoad()
       
        prepareUI()
        setBackButton()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        //  topScrollView?.adjustWhenControllerViewWillAppera()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
          collapsingView.contentSize = CGSize(width: 0, height: 1290)
    }
    func prepareUI() {
        view.addSubview(collapsingView)
         //setMatchParent(collapsingView, 0, 0)
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    lazy var collapsingView: CollapsingScrollView = {
           var v = CollapsingScrollView()
        v.frame = CGRect(x: 0, y: 66, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-66)
        v.backgroundColor = UIColor.brownColor()
        return v
    }()
    
    //添加返回事件
    func setBackButton(){
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "left_back_gray"), style: .Done, target: self, action: "back")
    }
    
    //返回事件
    func back() {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
