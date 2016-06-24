//
//  MainViewCell.swift
//  TumblrMenu
//
//  Created by Xuanyi Liu on 16/6/23.
//  Copyright © 2016年 Xuanyi Liu. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
