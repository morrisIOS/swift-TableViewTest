//
//  swityJsonModel.swift
//  swiftProjectDemo
//
//  Created by lzj on 2016/12/16.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit
import SwiftyJSON

class swityJsonModel: NSObject {

    var items = [itemModel]()
    var paging: String?
    
    init(JSOndictory:JSON ) {
        let data = JSOndictory["data"]["items"].array 
        self.paging = JSOndictory["data"]["paging"]["next_url"].string ?? ""
        
        for dataDic in  data!
        {
            
            let model =  itemModel()
            
            model.cover_image_url = dataDic["cover_image_url"].string ?? ""
            model.title =  dataDic["title"].string ?? ""
            
            let  numString = String(format:"%d",dataDic["likes_count"].intValue )
            model.likecount = numString
            items.append(model)
        }
    }
}

class itemModel: NSObject {
    
    var cover_image_url :String?
    var title :String?
    var likecount :String?
    var image_url: String?
    
}
