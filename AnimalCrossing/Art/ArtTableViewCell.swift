//
//  ArtTableViewCell.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 27/1/22.
//

import UIKit
import SDWebImage

class ArtTableViewCell: UITableViewCell {

    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var artLabel: UILabel!

    static let identifier = "artCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        artImageView.contentMode = .scaleAspectFit
        artLabel.text = "testing"
    }

    public func configure(with artArray: Art) {
        artLabel.text = artArray.name["name-USen"]?.capitalized

        let imgURL = URL(string: artArray.imageUrl)!
    
        artImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        artImageView.sd_setImage(with: imgURL)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

