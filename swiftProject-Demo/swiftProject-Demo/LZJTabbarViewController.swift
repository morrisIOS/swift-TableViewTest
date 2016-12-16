//
//  LZJTabbarViewController.swift
//  swiftProject-Demo
//
//  Created by 雷振杰 on 2016/11/29.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     *  16进制 转 RGBA
     */
    class func rgbaColorFromHex(rgb:Int, alpha: CGFloat) ->UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    /**
     *  16进制 转 RGB
     */
    class func rgbColorFromHex(rgb:Int) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
}

class LZJTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isTranslucent = false

        let titles = ["圈子","发现","消息","我的"]
        let classNames = ["FirstViewController","SecondViewController","ThirdViewController",
                          "FourthViewController"]
        let images = ["a","a","a","a"]
        
        
        for i in 0..<titles.count {
            let selImg = images[i] + "1"
            let nav = viewControllerWithClassName(classNames[i], image: UIImage(named: images[i])!, selectedImgae: UIImage(named: selImg)!, title: titles[i])
            
            self.addChildViewController(nav)
        }
    }
    
    func viewControllerWithClassName(_ className: String, image: UIImage, selectedImgae: UIImage, title: String) -> LZJNavViewController {
        
        let vcName: AnyClass = NSClassFromString("swiftProjectDemo." + className)!
        let pClass = (vcName as! UIViewController.Type).init()
        
        let viewController = LZJNavViewController(rootViewController: pClass)
        
        var imgSelected = selectedImgae
        imgSelected = imgSelected.withRenderingMode(.alwaysOriginal)
        
        pClass.tabBarItem.title = title
        pClass.tabBarItem.image = image
        pClass.tabBarItem.selectedImage = imgSelected
        
        pClass.title = title
        
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.rgbaColorFromHex(rgb: 0x8e8e93, alpha: 1),NSFontAttributeName:UIFont.systemFont(ofSize: 12)] , for: .normal)
        
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.rgbaColorFromHex(rgb: 0x79b2fb, alpha: 1),NSFontAttributeName:UIFont.systemFont(ofSize: 12)] , for: .selected)
        
        return viewController
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
