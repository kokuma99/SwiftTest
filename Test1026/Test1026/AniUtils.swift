//
//  AniUtils.swift
//  Test1026
//
//  Created by kokuma on 2016/12/20.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import Foundation


//弹簧动画
func aniDamping(view: UIView) -> () {
    view.transform = CGAffineTransformMakeScale(0, 0)
    UIView.animateWithDuration(1, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
        view.transform = CGAffineTransformIdentity
    }) { (_) -> Void in
        
    }
}