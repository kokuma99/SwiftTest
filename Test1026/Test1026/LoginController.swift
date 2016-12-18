//
//  LoginController.swift
//  Test1026
//
//  Created by kokuma on 2016/12/18.
//  Copyright © 2016年 kokuma. All rights reserved.
//

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        //loadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /**
     准备UI
     */
    func prepareUI() { //UITextViewTextDidChangeNotification
        view.addSubview(phoneNumberField)
        view.addSubview(passwordField)
        view.addSubview(commitButton)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didChangeValueForContentTextView(_:)), name: UITextFieldTextDidChangeNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

   @objc func didChangeValueForContentTextView(notification: NSNotification){
       print("changeCommitState")
      if phoneNumberField.text?.characters.count >= 10 && passwordField.text?.characters.count >= 5 {
         commitButton.enabled = true
         commitButton.backgroundColor = RED
      }else {
        commitButton.enabled = false
        commitButton.backgroundColor = UIColor(red:0.733, green:0.733, blue:0.733, alpha:1)
    }
    }
    
     func didTappedCommitButton(){
       NetUtils.shareNetUtils.login(phoneNumberField.text!, loginPwd: passwordField.text!.md5) { (success, result, error) in
        print("登陆成功啦哈哈哈")
        guard let result=result else {
            return
        }
        //let data = result["data"].arrayObject as! [[String : AnyObject]]
        let data = result.object as? OpenAccountBean
         let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
          appDelegate.token = data?.token
          OpenAccountBean.saveAccount(data!)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
   /// 提交按钮 
    lazy var commitButton: UIButton = {
        let commitButton = UIButton(type: UIButtonType.System)
       commitButton.frame = CGRect(x: 60, y: 220, width: SCREEN_WIDTH - 120, height: 44)
        commitButton.setTitle("提交", forState: UIControlState.Normal)
        commitButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        commitButton.layer.cornerRadius = CORNER_RADIUS
        commitButton.enabled = false
        commitButton.backgroundColor = UIColor(red:0.733, green:0.733, blue:0.733, alpha:1)
        commitButton.addTarget(self, action: "didTappedCommitButton", forControlEvents: UIControlEvents.TouchUpInside)
        return commitButton }()
    
    private lazy var nicknameField: UITextField = {
        let field = UITextField(
        frame: CGRect(x: 60, y: 0, width: SCREEN_WIDTH - 120, height: 44))
        field.font = UIFont.systemFontOfSize(14)
        field.placeholder = "昵称"
        field.clearButtonMode = .WhileEditing
         field.layer.cornerRadius = CORNER_RADIUS
        field.backgroundColor = UIColor(red:0.883, green:0.883, blue:0.883, alpha:1)
        return field
    }()
    
    
    private lazy var phoneNumberField: UITextField = {
        let field = UITextField(frame: CGRect(x: 60, y: 100, width: SCREEN_WIDTH - 120, height: 44))
        field.font = UIFont.systemFontOfSize(14)
        field.placeholder = "请输入手机号"
        field.keyboardType = .NumberPad
        field.clearButtonMode = .WhileEditing
        field.layer.cornerRadius = CORNER_RADIUS
        
         field.backgroundColor = UIColor(red:0.883, green:0.883, blue:0.883, alpha:1)
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField(frame: CGRect(x: 60, y: 160, width: SCREEN_WIDTH - 120, height: 44))
        field.font = UIFont.systemFontOfSize(14)
        let imgView = UIImageView(image: UIImage(named: "caogao"))
         field.leftView = imgView
        field.placeholder = "请输入密码"
        field.secureTextEntry = true
        field.clearButtonMode = .WhileEditing
        field.layer.cornerRadius = CORNER_RADIUS
        field.backgroundColor = UIColor(red:0.883, green:0.883, blue:0.883, alpha:1)
        return field
    }()
   
    
}
