//
//  FirstAidEntry.swift
//  Plum
//
//  Created by 大畅 on 2016/11/17.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class FirstAidEntry: NSObject {
    
    var firstAidName : String
    
    var firstAidThumbnail : UIImage!
    
    init(name: String) {
        self.firstAidName = name
        self.firstAidThumbnail = UIImage(named: "FirstAidTableViewCell_" + name)
    }
}
