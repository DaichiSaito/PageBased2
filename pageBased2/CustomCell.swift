//
//  CustomCell.swift
//  pageBased2
//
//  Created by DaichiSaito on 2016/02/16.
//  Copyright © 2016年 DaichiSaito. All rights reserved.
//

import UIKit
class CustomCell: UICollectionViewCell {
    @IBOutlet var imgSample:UIImageView!
    @IBOutlet var lblSample:UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}