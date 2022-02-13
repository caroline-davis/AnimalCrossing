//
//  VillagerViewControllerTests.swift
//  AnimalCrossingTests
//
//  Created by Caroline Davis on 11/2/22.
//

@testable import AnimalCrossing
import XCTest
import Combine

class VillagersDetailViewControllerTests: XCTestCase {

    var viewModel: VillagersDetailViewModel!
    var viewController: VillagersDetailViewController!
    var storyboard: UIStoryboard!
    var subscriptions = Set<AnyCancellable>()

    var villager: Villager!

    override func setUp() {
        super.setUp()

        villager = [ "id": 1,
            "name": ["english": "Mandy"],
            "birthday": "02/09/1986",
            "personality": "Lazy",
            "species": "Monkey",
            "gender": "Female",
            "hobby": "Drawing",
            "catchPhrase": "Monkey see monkey do",
            "imageUrl": "https://acnhapi.com/v1/images/villagers/1",
            "saying": "Sometimes it rains, sometimes it doesn't."]


        viewModel = VillagersDetailViewModel(selectedItem: villager)
        storyboard = UIStoryboard(name:"VillagersDetail",
                                  bundle:nil)

        viewController = storyboard.instantiateViewController(withIdentifier: "VillagersDetailViewController") as? VillagersDetailViewController
        viewController.villagersDetailViewModel = viewModel
        viewController.loadViewIfNeeded()
    }


    func testInitialItems() {

        XCTAssertEqual(viewController.nameLabel, "Mandy")

    }


}

