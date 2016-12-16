//
//  SecondViewController.swift
//  swiftProject-Demo
//
//  Created by lzj on 2016/11/29.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher


class itemsModel: NSObject {
    
    var cover_image_url = ""
    var title  = ""
    var likecount = ""
    
}



class SecondViewController: LZJViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataArray = [itemsModel]()
    var dataTable:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTBView()

        
        LZJNetWork.sharedInstance.getRequest(
            urlString: "http://api.liwushuo.com/v2/channels/104/items?ad=2&gender=2&generation=2&limit=20&offset=0",
            params: [:],
            success: { (_ result) in
                
//                print(result)
                
//                let JSOnDictory = JSON(result)
                
                let JSOndictory:(JSON) = result as! (JSON)
                
                let data = JSOndictory["data"]["items"].array
                
                for dataDic in  data!
                {
                    
                    let model =  itemsModel()
                    
                    model.cover_image_url = dataDic["cover_image_url"].string ?? ""
                    model.title =  dataDic["title"].string ?? ""
                    
                    let  numString = String(format:"%d",dataDic["likes_count"].intValue )
                    model.likecount = numString
                    self.dataArray.append(model)
                    
                }
                
                self.dataTable.reloadData()
                
        }) { (error) in
            
        }
        
    }
    
    func initTBView() {
        dataTable = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64 - 49) , style: .plain)
        dataTable.delegate = self
        dataTable.dataSource = self
        dataTable.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(dataTable)
        
        dataTable.register(UINib.init(nibName: "SecondTBCell", bundle: nil), forCellReuseIdentifier: "SecondTBCell")
        
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let model = self.dataArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTBCell") as! SecondTBCell
        
        cell.backImgView?.kf.setImage(with: ImageResource.init(downloadURL: NSURL(string: model.cover_image_url) as! URL))
        
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
