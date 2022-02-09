//
//  VillagersDetailViewModel.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 9/2/22.
//

import Foundation
import UIKit
import SDWebImage

class VillagersDetailViewModel {

    let selectedItem: Villager

    init(selectedItem: Villager) {
        self.selectedItem = selectedItem
    }

    var name: String {
        return selectedItem.name["name-USen"]?.capitalized ?? ""
    }

    var personality: String {
        return selectedItem.personality
    }

    func setImage(villagerImageView: UIImageView) {
        let imgURL = URL(string: selectedItem.imageUrl)!
        villagerImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        villagerImageView.sd_setImage(with: imgURL)
    }

}
