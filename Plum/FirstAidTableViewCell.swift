//
//  FirstAidTableViewCell.swift
//  Plum
//
//  Created by 大畅 on 2016/11/16.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class FirstAidTableViewCell: UITableViewCell {

    @IBOutlet weak var FirstAidTableViewCellImageView: UIImageView!
    @IBOutlet weak var FirstAidTableViewCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
