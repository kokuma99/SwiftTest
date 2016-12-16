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

//typealias NetworkFinished = (success:Bool,result:JSON?, error:NSError?) -> ()

class ViewController: UIViewController {
    
    var  data = [NSObject]();
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
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }

    }
    
    private func prepareUI2(){
        let txtView1 = UILabel(frame: CGRect(x: 20,y: 40,width: 200,height: 100))
        txtView1.text="kokuma de su ne"
        view.addSubview(txtView1)
    }
    
    @objc private func didTapped(){
        toController(BaseTabBarController())
       //getAcg()
        //toFutureController()
        
                    //SVProgressHUD.show()
    }
    
    func getAcg() {
        NetUtils.shareNetUtils.getAcgs("1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                self.data.append(AcgBean(dict : dict))
               // print("\(self..last?.id)")
                //  print("\(self..last?.positive)")
            }
            self.listV.data = self.data
            self.listV.reloadData()
        }
    }
    func getVenue() {
        NetUtils.shareNetUtils.getVenuesByKeyword("", page: "1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                 self.data.append(AcgBean(dict : dict))
               // print("\(self..last?.id)")
                 //  print("\(self..last?.positive)")
            }
            self.listV.data = self.data
            self.listV.reloadData()
        }
    }
    
    
    func getUsers(){
        NetUtils.shareNetUtils.getRecommendUsers("1") { (success, result, error) in
            guard let result=result else {
                return
            }
            let data = result["data"].arrayObject as! [[String : AnyObject]]
            for dict in data {
                self.data.append(OpenAccountBean(dict : dict))
                 //  print("\(self..last?.id)")
                //    print("\(self..last?.positive)")
            }
            self.listV.data = self.data
            self.listV.reloadData()
        }
    }
    
   func  getPersonalPlan(){
    var param=[String : AnyObject]()
    param["positive"] = 1
    param["page"] = 1
    param["perPage"] = 4
    
    ViewController.loadData("/personalPlan", parameters: param){(success,result,error) in
    guard let result=result else {
    return
    }
    let data = result["data"].arrayObject as! [[String : AnyObject]]
    for dict in data {
//    self..append(DynamicBean(dict: dict))
//    print("\(self..last?.id)")
//    print("\(self..last?.positive)")
    }
   // self.listV.=self.;
    self.listV.reloadData()
    }
    }
    func toFutureController(){
        let toController = JFNewFeatureViewController()
      navigationController?.pushViewController(toController, animated: true)
    }
    
    lazy var box : UIButton = {
        let button = UIButton()
        button.backgroundColor=UIColor(red: 50/255, green: 200/255, blue: 189/255, alpha: 1.0)
        button.addTarget(self, action: #selector(didTapped), forControlEvents: .TouchDown)
        return button
    }()
    
    lazy var listV: BaseTableView={
        let listV = BaseTableView()
        listV.prepareUI(VenueCell.classForCoder(),height: LIST_ITEM_HEIGHT1_1)
        return listV
    }()
    
    //,finished: NetworkFinished
    class func loadData(url:String,parameters: [String : AnyObject]?,finished:NetworkFinished){
        Alamofire.request(.GET, "\(API_BASE_URL)\(url)",parameters: parameters).responseJSON { (response) -> Void in
            //do something
            print(response.debugDescription)
            if let data = response.data{
                let json = JSON(data: data)
                finished(success: true,result: json,error: nil)
            }else {
                SVProgressHUD.showInfoWithStatus("您的网络不给力哦")
                finished(success: false, result: nil, error: response.result.error)
            }
           // if let total = json["total"].int {
           //     print("total-xxl-\(total)")
           // }
            
           // if let frontCover = json[["data",0,"acg","frontCover"]].string{
            //    print("total-xxl-\(frontCover)")
            //}
        }

    }
    
    
}

