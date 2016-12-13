//
//  FirstAidSymptomTableViewCell.swift
//  Plum
//
//  Created by 大畅 on 2016/12/8.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class FirstAidSymptomTableViewCell: UITableViewCell {

    @IBOutlet weak var symptomIconImage: UIImageView!
    
    @IBOutlet weak var symptomLabel: UILabel!
    
    @IBOutlet weak var symtomTextView: UITextView!
    
    @IBOutlet weak var symptomTextViewHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
