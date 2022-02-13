//
//  VillagersDetailViewModelTests.swift
//  AnimalCrossingTests
//
//  Created by Caroline Davis on 11/2/22.
//

@testable import AnimalCrossing
import XCTest

class VillagersDetailViewModelTests: XCTestCase {

    var viewModel: VillagersDetailViewModel!
    var villager: Villager!

    override func setUp() {
        super.setUp()

        villager = [
            id: 1,
            name: ["english": "Mandy"],
            birthday: "02/09/1986",
            personality: "Lazy",
            species: "Monkey",
            gender: "Female",
            hobby: "Drawing",
            catchPhrase: "Monkey see monkey do",
            imageUrl: "https://acnhapi.com/v1/images/villagers/1",
            saying: "Sometimes it rains, sometimes it doesn't."
        ]

        viewModel = VillagersDetailViewModel(selectedItem: villager)
    }

}
