//
//  TableViewCell.swift
//  AnimateTable
//
//  Created by Echo on 16/4/28.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        gradientLayer.frame = self.bounds
        let color1 = UIColor.init(white: 1, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor.init(white: 1, alpha: 0.1).cgColor as CGColor
        let color3 = UIColor.init(white: 1, alpha: 0.0).cgColor as CGColor
        let color4 = UIColor.init(white: 0, alpha: 0.05).cgColor as CGColor
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
}
