//
//  InterestCollectionViewCell.swift
//  CarouselEffect
//
//  Created by Echo on 16/4/19.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    func updateUI() {
        interestTitleLabel.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
