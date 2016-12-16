//
//  ThirdViewController.swift
//  swiftProject-Demo
//
//  Created by lzj on 2016/11/29.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import HandyJSON

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var dataArray:NSArray = []
    var dataTable:UITableView!
    
    var data:[JSON]!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTBView()
        
        self.view.backgroundColor = UIColor.red
        
        LZJNetWork.sharedInstance.lzjgetRequest(
            urlString: "http://api.liwushuo.com/v2/channels/104/items?ad=2&gender=2&generation=2&limit=20&offset=0",
            params: [:],
            success: { (_ result) in
                
                //                print(result)
                
                //                let JSOnDictory = JSON(result)
                
//                let JSOndictory:(JSON) = result as! (JSON)
//                
//                self.data = JSOndictory["data"]["items"].array
//                
//                self.dataArray = self.data as NSArray!
                
                let dict = result
                

                let jsonStr = JSONSerializer.serializeToJSON(object: dict["data"]?["items"]!)
                
                
                if let items = JSONDeserializer<items>.deserializeModelArrayFrom(json: jsonStr) {
//                    items.forEach({ (item) in
//                        if let _item = item {
//                            print(_item)
//                        }
//                    })
                    self.dataArray = items as NSArray
                }
                
                self.dataTable.reloadData()
                
        }) { (error) in
            
        }
        
    }
    
    func initTBView() {
        dataTable = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 49 ) , style: .plain)
        dataTable.delegate = self
        dataTable.dataSource = self
        self.view.addSubview(dataTable)
        dataTable.register(UINib.init(nibName: "SecondTBCell", bundle: nil), forCellReuseIdentifier: "SecondTBCell")
        
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

//        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "mycell1")
//
//        let model = self.data[indexPath.row]
//        
//        cell.textLabel?.text = model["title"].string
//        cell.imageView?.kf.setImage(with: ImageResource.init(downloadURL: NSURL(string: model["cover_image_url"].string!) as! URL))
        
        let model = self.dataArray[indexPath.row] as! items
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTBCell") as! SecondTBCell

        cell.backImgView?.kf.setImage(with: ImageResource.init(downloadURL: NSURL(string: model.cover_image_url ?? model.image_url!) as! URL))

        cell.lblTitle.text = model.title

        cell.lblLike.text = model.likecount
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTBCell") as! SecondTBCell
        
        let size = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        
        return size.height + 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
