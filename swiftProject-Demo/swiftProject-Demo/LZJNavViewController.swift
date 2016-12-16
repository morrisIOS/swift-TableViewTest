//
//  LZJNavViewController.swift
//  swiftProject-Demo
//
//  Created by lzj on 2016/11/29.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit

class LZJNavViewController: UINavigationController,UIGestureRecognizerDelegate {
    
    var pan = UIPanGestureRecognizer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black,NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        
        let target = self.interactivePopGestureRecognizer?.delegate
        
        let pan = UIPanGestureRecognizer(target: target, action: Selector("handleNavigationTransition:"))
        pan.delegate = self
//        self.view.addGestureRecognizer(pan)
        self.pan = pan
        
        self.interactivePopGestureRecognizer?.isEnabled = false
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let translation = (gestureRecognizer as! UIPanGestureRecognizer).translation(in: self.view.superview)
        
        if translation.x < 0 {
            return false
        }
        
        if self.viewControllers.count <= 1 {
            return false
        }
        
        return true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
