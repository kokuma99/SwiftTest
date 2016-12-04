//
//  BaseColectionView.swift
//  Test1026
//
//  Created by kokuma on 2016/12/4.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import UIKit

class BaseColectionView: UICollectionView{
    var cellIdentifier = "cellIdentifier"
    
    
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
        self.dataSource=self
        self.delegate=self
        showsHorizontalScrollIndicator = false
        registerClass(ImgWithTxtView.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    }
    
}

extension BaseColectionView:  UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //
    }
    
}
