//
//  SecondTBCell.swift
//  swiftProjectDemo
//
//  Created by lzj on 2016/12/6.
//  Copyright © 2016年 lzj. All rights reserved.
//

import UIKit

class SecondTBCell: UITableViewCell {

    @IBOutlet weak var backImgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var imgHeightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgHeightConstraint.constant = backImgView.bounds.width * UIScreen.main.bounds.height / UIScreen.main.bounds.height
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
