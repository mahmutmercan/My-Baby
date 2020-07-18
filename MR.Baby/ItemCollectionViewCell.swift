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
        imageView.layer.cornerRadius = 12.0
        coverImageOverlay.alpha = 0.3
        coverImageOverlay.contentMode = .scaleToFill
        coverImageOverlay.layer.cornerRadius = 12.0
//        coverImageOverlay.isHidden = true
    }

}
