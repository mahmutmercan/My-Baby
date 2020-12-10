//
//  ItemCollectionViewCell.swift
//  MR.Baby
//
//  Created by İlker isa Mercan on 4.07.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var audioTitleLabel: UILabel!
    @IBOutlet weak var audioPackageItemCountsLabel: UILabel!
    @IBOutlet weak var coverImageOverlay: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell(){
        setupCellShadow()

        self.imageView.contentMode = .scaleToFill
        self.imageView.layer.cornerRadius =  12.0
        self.imageView.layer.masksToBounds = true
        self.imageView.clipsToBounds = true
        self.coverImageOverlay.alpha = 0.5
        self.coverImageOverlay.contentMode = .scaleToFill
        self.coverImageOverlay.layer.cornerRadius =  12.0
        self.coverImageOverlay.layer.masksToBounds = true
        self.coverImageOverlay.clipsToBounds = true
        self.contentView.backgroundColor  = .clear
    }
    
    func setupCellShadow(){
       self.layer.shadowColor = UIColor.black.cgColor
       self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
       self.layer.shadowRadius = 1
       self.layer.shadowOpacity = 0.3
       self.layer.masksToBounds = false
       self.layer.shouldRasterize = true
       self.layer.rasterizationScale = UIScreen.main.scale
    }
}
