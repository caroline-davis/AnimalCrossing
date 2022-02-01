//
//  ArtDetailViewModel.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 1/2/22.
//

import Foundation


class ArtDetailViewModel {

    let selectedItem: Art

    init(selectedItem: Art) {
        self.selectedItem = selectedItem
    }

    var hasFake: String {
        return "Has fake: \(selectedItem.hasFake)"
    }

    var name: String {
        return selectedItem.name["name-USen"]?.capitalized ?? ""
    }

    var buyPrice: String {
        return "Buy price: \(selectedItem.buyPrice)"
    }

    var sellPrice: String {
        return "Sell price: \(selectedItem.sellPrice)"
    }

    var imageDescription: String {
        return selectedItem.imageDescription
    }

}
