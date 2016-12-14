//
//  BaseColectionView.swift
//  Test1026
//
//  Created by kokuma on 2016/12/4.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

protocol BaseColectionCellDelegate: NSObjectProtocol {
    func baseColectionCell(indexPath: NSIndexPath)
}
class BaseColectionView: UICollectionView {
    var cellIdentifier = "cellIdentifier"
    var data: AnyObject? {
        didSet {
            self.reloadData()
        }
    }
    var topUIEdgeInset,leftUIEdgeInset,bottomUIEdgeInset,rightUIEdgeInset : CGFloat?
    
    
    weak var baseDelegate: BaseColectionCellDelegate?
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("has not been implemented")
    }
    
    internal func prepareUI1(){
        self.backgroundColor=UIColor.yellowColor()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1.5
        layout.minimumLineSpacing = 1.5
        layout.scrollDirection = .Horizontal
        layout.itemSize = CGSize(width: SCREEN_WIDTH * 0.21, height: SCREEN_WIDTH * 0.19)
        self.collectionViewLayout=layout
        dataSource=self
        delegate=self
        showsHorizontalScrollIndicator = false
        registerClass(ImgWithTxtView.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    
    internal func prepareUI(cellClass: AnyClass,width: Int,height: Int){
        self.backgroundColor=UIColor.yellowColor()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1.5
        layout.minimumLineSpacing = 1.5
        layout.scrollDirection = .Horizontal
        layout.itemSize = CGSize(width: width, height: height)
        self.collectionViewLayout=layout
       // self.dataSource=self
       // self.delegate=self
        showsHorizontalScrollIndicator = false
       self.registerClass(cellClass, forCellWithReuseIdentifier: cellIdentifier)
       
    }
    
    internal func setUIEdgeInsetsMake(top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) {
        self.topUIEdgeInset = top
        self.leftUIEdgeInset = left
        self.bottomUIEdgeInset = bottom
        self.rightUIEdgeInset = right
    }
    
    //Item绑定数据源，cell.category = data?[indexPath.item]
    func setItem(cell: UICollectionViewCell, didSelectItemAtIndexPath indexPath: NSIndexPath){
    }
    
    //Item点击事件
    // required func onItemClick(indexPath: NSIndexPath){
    // }
}

extension BaseColectionView :  UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let data = self.data as? NSArray
        return (data?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        setItem(cell,didSelectItemAtIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        baseDelegate?.baseColectionCell(indexPath)
    }
    
    //返回cell 上下左右的间距
//     func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//       return UIEdgeInsetsMake(5, 10, 5, 10)
//     }

}
