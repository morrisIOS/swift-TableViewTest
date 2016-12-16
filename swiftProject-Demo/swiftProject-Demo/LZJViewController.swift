//
//  LZJViewController.swift
//  swiftProjectDemo
//
//  Created by 雷振杰 on 2016/11/30.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit


class LZJViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        if (self.navigationController?.viewControllers.count)! > 1 {
            
            let spaceItem = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            spaceItem.width = -10
            self.navigationItem.leftBarButtonItems = [spaceItem, self.customBackItem(taget: self, action:#selector(LZJViewController.onBack))]
        }
    }
    
    func customBackItem(taget: Any, action: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        button.setImage(UIImage.init(named:"a1"), for: .normal)
        button.setTitle(" 我不返回", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button .addTarget(taget, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView: button)
    }
    
    func onBack() {
        _ = self.navigationController?.popViewController(animated: true)
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
