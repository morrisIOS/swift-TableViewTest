//
//  FirstViewController.swift
//  swiftProject-Demo
//
//  Created by lzj on 2016/11/29.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: LZJViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
        
        let btn = UIButton(frame: CGRect(x: 10, y: 80, width: 30, height: 30))
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(FirstViewController.btnClick), for: .touchUpInside)
        
//        self.DownLoadData()
        
        
    }
    
    func DownLoadData() {
        
        Alamofire.request("https://api.500px.com/v1/photos", method: .get).responseJSON {
            response in
            guard let JSON = response.result.value else { return }
            print("JSON: \(JSON)")
        }
        
    }
    
    public func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest
    {
        return SessionManager.default.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
    }
    
    
    func btnClick() {
        let sec = SecondViewController()
        self.navigationController?.pushViewController(sec, animated: true)
        
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
