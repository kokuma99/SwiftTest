//  MyProfileController.swift
//  Test1026
//
//  Created by kokuma on 2016/12/15.
//  Copyright © 2016年 kokuma. All rights reserved.
//

//MyProfileController

class MyProfileController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        loadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /**
     准备UI
     */
    func prepareUI() {
        self.view.addSubview(avatarGroupView)
        avatarGroupView.snp_makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(AVATAR_HEIGHT + 30)
        }
        
        let icons = ["dingyue","guanzhu","mingpian","caogao","shezhi"]
        let titles = ["我的订阅","我的关注/粉丝","二维码名片","草稿箱","设置"]
        for i in 0...4 {
            let itemView = getItemView(icons[i],title: titles[i])
            let tap = UITapGestureRecognizer(target: self, action: Selector("click\(i+1):"))
            itemView.addGestureRecognizer(tap)
            self.view.addSubview(itemView)
            //设置位置和宽高
            layoutItem(itemView,i)
        }
    }
    
    func click1(tap: UITapGestureRecognizer){
        
    }
    
    func click2(tap: UITapGestureRecognizer){
        
    }
    
    func click3(tap: UITapGestureRecognizer){
        
    }
    
    func click4(tap: UITapGestureRecognizer){
        
    }
    
    func click5(tap: UITapGestureRecognizer){
        
    }
    
    
    private func layoutItem( item: UIView,_ index: Int){
        item.snp_makeConstraints { (make) in
            if index==4  {
                make.top.equalTo(avatarGroupView.snp_bottom).offset(CGFloat(index) * (ITEMVIEW_HEIGHT+1)+50+10)
            }else {
                make.top.equalTo(avatarGroupView.snp_bottom).offset(CGFloat(index)  * (ITEMVIEW_HEIGHT+1)+50)
            }
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(ITEMVIEW_HEIGHT)
        }
    }
    
    func tapAvatarGroupView(){
        
    }
    /**
     准备UI
     */
    func loadData() {
        // NetUtils.shareNetUtils
    }
    
    func getItemView(icon_name: String,title: String) ->  ItemView{
        let view = ItemView()
        view.backgroundColor = UIColor.yellowColor()
        view.data = ["icon_name":icon_name,"title":title]
        return view
    }
    
    lazy var avatarGroupView : AvatarGroupView = {
        let view = AvatarGroupView()
       // view.addTarget(self, action: #selector(tapAvatarGroupView), forControlEvents: .TouchDown)
        return view
    }()
    
}
