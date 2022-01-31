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

        // this should be used with SDWeb image view pod or something so it doesnt fetch the wrong data if scrolling also somehow with combine potentially too.
        let imgURL = URL(string: artArray.imageUrl)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imgURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.artImageView.image = image
                    }
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

