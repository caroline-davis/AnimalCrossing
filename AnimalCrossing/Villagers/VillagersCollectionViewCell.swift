//
//  VillagersCollectionViewCell.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 8/2/22.
//

import UIKit
import SDWebImage

class VillagersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "villagersCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFill
        layoutMargins = UIEdgeInsets.zero
    }

    public func configure(with villagersArray: Villager) {

        let imgURL = URL(string: villagersArray.imageUrl)!
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: imgURL)
    }
    
}
