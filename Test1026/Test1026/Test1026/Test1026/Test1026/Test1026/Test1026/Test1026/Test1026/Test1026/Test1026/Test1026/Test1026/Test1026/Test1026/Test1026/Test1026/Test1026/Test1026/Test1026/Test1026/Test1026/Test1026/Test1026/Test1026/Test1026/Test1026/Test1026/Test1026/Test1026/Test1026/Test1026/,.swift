//
//  ViewController.swift
//  Test1026
//
//  Created by kokuma on 16/10/26.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

typealias NetworkFinished = (success:Bool,result:String, error:NSError) -> ()

class ViewController: UIViewController {
   
    //外网    
    override func viewDidLoad() {
        super.viewDidLoad()
       prepareUI1()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    private func prepareUI1(){
        self.view.addSubview(box)
        self.view.addSubview(listV)
        box.snp_makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(0)
            make.height.equalTo(20)
            make.width.equalTo(100)
       }
        listV.snp_makeConstraints { (make) in
            make.top.equalTo(180)
            make.left.equalTo(0)
            make.height.equalTo(300)
            make.width.equalTo(200)
        }

    }
    
    private func prepareUI2(){
        let txtView1 = UILabel(frame: CGRect(x: 20,y: 40,width: 200,height: 100))
        txtView1.text="kokuma de su ne"
        view.addSubview(txtView1)
    }
    
    @objc private func didTapped(){
        var param=[String : AnyObject]()
        param["positive"] = 1
        param["page"] = 1
        param["perPage"] = 4
        ViewController.loadData("/personalPlan", parameters: param)
    }
    
    
    lazy var box : UIButton = {
        let button = UIButton()
        button.backgroundColor=UIColor(red: 50/255, green: 200/255, blue: 189/255, alpha: 1.0)
        button.addTarget(self, action: #selector(didTapped), forControlEvents: .TouchDown)
        return button
    }()
    
    lazy var listV: PersonalPlanList={
        let listV = PersonalPlanList()
        listV.prepareUI()
        return listV
    }()
    //,finished: NetworkFinished
    class func loadData(url:String,parameters: [String : AnyObject]?){
        Alamofire.request(.GET, "\(API_BASE_URL)\(url)",parameters: parameters).responseJSON { (response) -> Void in
            //do something
            print(response.debugDescription)
            
        }

    }
    
}

