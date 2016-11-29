//
//  ProfileListSectionTableViewCell.swift
//  Plum
//
//  Created by 大畅 on 2016/11/29.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class ProfileListSectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
