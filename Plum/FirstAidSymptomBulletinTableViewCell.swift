//
//  FirstAidSymptomBulletinTableViewCell.swift
//  Plum
//
//  Created by 大畅 on 2016/12/13.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class FirstAidSymptomBulletinTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
