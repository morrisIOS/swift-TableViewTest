//
//  FourthViewController.swift
//  swiftProjectDemo
//
//  Created by 雷振杰 on 2016/11/30.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit
import SwiftyJSON

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        LZJNetWork.sharedInstance.getRequest(
            urlString: "http://api.liwushuo.com/v2/channels/104/items?ad=2&gender=2&generation=2&limit=20&offset=0",
            params: [:],
            success: { (_ result) in
                
                let testModel = swityJsonModel(JSOndictory: result as! JSON)
                print(testModel.paging!)
                
        }) { (error) in
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
