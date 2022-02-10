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
        return "Type: \(selectedItem.personality)"
    }

    var species: String {
        return  "Species: \(selectedItem.species)"
    }

    var catchPhrase: String {
        return  "Catch Phrase: \(selectedItem.catchPhrase)"
    }

    var saying: String {
        return  "Saying: \(selectedItem.saying)"
    }

    func setImage(villagerImageView: UIImageView) {
        let imgURL = URL(string: selectedItem.imageUrl)!
        villagerImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        villagerImageView.sd_setImage(with: imgURL)
    }

}
