//
//  ArtTableViewCell.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 27/1/22.
//

import UIKit


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
        let data = try? Data(contentsOf: imgURL)
        if let imageData = data {
            let image = UIImage(data: imageData)
            self.artImageView.image = image
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

