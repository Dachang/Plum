//
//  ProfileListBannerTableViewCell.swift
//  Plum
//
//  Created by 大畅 on 2016/11/29.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class ProfileListBannerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellThumbnailCapLetter: UILabel!
    @IBOutlet weak var cellProfileName: UILabel!
    @IBOutlet weak var cellDateOfBirthTitle: UILabel!
    @IBOutlet weak var cellDateOfBirthContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
