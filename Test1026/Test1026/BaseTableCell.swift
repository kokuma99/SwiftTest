//
//  BaseTableCell.swift

//

import UIKit
//import YYWebImage
class BaseTableCell: UITableViewCell {
    
    // MARK: 属性
    var data: NSObject? {
        didSet {
            //用户列表版table
            //   imageView_avatar.yy_imageURL = NSURL(string: videoInfo!.cover!)
            //  titleLabel.text = videoInfo!.title!
            bindUI()
        }
    }
    
    
    internal func bindUI(){
        //绑定数据
        // let data = self.data as? NSArray
    }
    
    
    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    
    // MARK: - 准备UI
    internal func prepareUI() {
        // 添加子控件
        //  contentView.addSubview(backgroundImageView)
        
        // 添加约束
        //backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        // startButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView_avatar)
        contentView.addSubview(label_content)
        contentView.addSubview(label_title)
        contentView.addSubview(label_follow)
        imageView_avatar.snp_makeConstraints { (make) in
            // make.edges.equalTo(contentView)
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: AVATAR_HEIGHT, height: AVATAR_HEIGHT))
        }
        
        label_follow.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-20)
            make.size.equalTo(CGSize(width: AVATAR_HEIGHT, height: 30))
        }
        label_title.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(label_follow.snp_left).offset(-10)
            make.left.equalTo(imageView_avatar.snp_right).offset(10)
        }
        label_content.snp_makeConstraints { (make) in
            make.bottom.equalTo(-10)
           // make.right.equalTo(label_follow.snp_left).offset(-10)
            make.left.equalTo(imageView_avatar.snp_right).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    
    /**
     开始按钮点击
     */
    func startButtonClick() {
        // UIApplication.sharedApplication().keyWindow?.rootViewController = UIStoryboard.init(name: "JFNewsViewController", bundle: nil).instantiateInitialViewController()
    }
    
    //绑定Acg数据frontCover name count "订阅："   "人"  "订阅：0人" (AcgAdapter2,item_acg_search2)
    func bindAcg(mAcgBean: AcgBean,imageView_cover: UIImageView,label_title: UILabel,label_content: UILabel,label_follow: UILabel?) {
        imageView_cover.sd_setImageWithURL(NSURL(string: mAcgBean.frontCover==nil ? "" : mAcgBean.frontCover!))
        label_title.text = mAcgBean.name
        label_content.text = "订阅：\(mAcgBean.count)人"
        label_follow?.text = "+订阅"
    }
    
    //绑定Topic数据content "分享专题"  zanCount "次喜欢"  dynamicView.getPictureView().get(0).getPicUrl()
  	 func bindDynamic_topic(mDynamic: DynamicBean,imageView_cover: UIImageView,label_title: UILabel,label_content: UILabel,label_follow: UILabel?) {
        if mDynamic.pictureView != nil{
            let pics  = mDynamic.pictureView
            let pic: PictureBean = PictureBean(dict: pics![0] as! [String : AnyObject])
           // let pic = pics[0]
            imageView_cover.sd_setImageWithURL(NSURL(string: (pic.picUrl)!))
         }
        
       let content =  mDynamic.content
        label_title.text = content==nil ? "分享专题" : content
        label_content.text = "\(mDynamic.zanCount)次喜欢"
    }
    
    //绑定Cos正片数据authorAvatar   author  "小曼" acgName   readCount   bean.getExcellentWorksImagesView().get(0).getPicUrl()
    func bindDynamic_COS(mDynamic: DynamicBean,imageView_cover: UIImageView,label_title: UILabel,label_content: UILabel,label_follow: UILabel?) {
        if mDynamic.pictureView != nil{
            let pics  = mDynamic.pictureView
            let pic: PictureBean = PictureBean(dict: pics![0] as! [String : AnyObject])
            // let pic = pics[0]
            imageView_cover.sd_setImageWithURL(NSURL(string: (pic.picUrl)!))
        }
        label_title.text = mDynamic.dynamicExtras?.acgName
        label_content.text = "\(mDynamic.characterSetView?.readCount)次喜欢"
    }
    
    //绑定场地数据 mVenueView.getCover() mVenueView.getTags() (mVenueView.getCreatorAvatarUrl() mVenueView.getCreatorDisplayName()
    func bindVenue(mVenue: VenueBean,imageView_cover: UIImageView,label_title: UILabel,label_content: UILabel,label_follow: UILabel?) {
        imageView_cover.sd_setImageWithURL(NSURL(string: mVenue.cover==nil ? "" : mVenue.cover!))

        label_title.text = mVenue.name
        //标签待定
        label_content.text = mVenue.tags?[0]
    }
    
    // MARK: - 懒加载
    /// 背景
     lazy var imageView_bg = UIImageView()
    
    /// 关注按钮
     lazy var label_follow: UILabel = {
        let view = UILabel()
        view.backgroundColor = RED
        view.textAlignment = NSTextAlignment.Center
        view.font = UIFont.systemFontOfSize(12)
        view.text = "+关注"
        view.textColor = UIColor.whiteColor()
        view.layer.cornerRadius = FOLLOW_HEIGHT/2
        view.layer.masksToBounds = true
        return view
    }()
    
    /// 内容
    internal lazy var label_content: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.backgroundColor = UIColor.clearColor()
        view.textAlignment = NSTextAlignment.Center
        view.font = UIFont.systemFontOfSize(12)
        view.textColor = UIColor.colorWithHexString("#999999")
        view.text = "我是小柠檬"
        return view
    }()
    
    /// 标题
     lazy var label_title: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.backgroundColor = UIColor.clearColor()
        view.textAlignment = NSTextAlignment.Center
        view.font = UIFont.systemFontOfSize(14)
        view.text = "小柠檬"
        view.textColor = UIColor.colorWithHexString("#333333")
        return view
    }()
    
    /// 头像
    internal lazy var imageView_avatar: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = AVATAR_HEIGHT/2
        view.layer.masksToBounds = true
        return view
    }()
    
    
}
