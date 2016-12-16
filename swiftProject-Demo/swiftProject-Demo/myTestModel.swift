//
//  myTestModel.swift
//  swiftProjectDemo
//
//  Created by lzj on 2016/12/9.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit
import HandyJSON

class myTestModel: HandyJSON {
    
    var items: [items]?
    var paging: String?

    required init() {}
}

struct items: HandyJSON {
    var cover_image_url :String?
    var title :String?
    var likecount :String?
    var image_url: String?
    
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &likecount, name: "likes_count")
    }
}
