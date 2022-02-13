//
//  HomeViewControllerTests.swift
//  AnimalCrossingTests
//
//  Created by Caroline Davis on 11/2/22.
//

@testable import AnimalCrossing
import XCTest
import Combine

class HomeViewControllerTests: XCTestCase {

    var viewModel: HomeViewModel!
    var viewController: HomeViewController!
    var storyboard: UIStoryboard!
    var subscriptions = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()

        viewModel = HomeViewModel()
        storyboard = UIStoryboard(name:"Main",
                                  bundle:nil)

        viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        viewController.homeViewModel = viewModel
        viewController.loadViewIfNeeded()
    }

    func testSetInitialItems() {
        viewController.setInitialItems()
        XCTAssertEqual(viewController.headingLabel.text, "Animal Crossing")
    }

    func testSetStyles () {
        viewController.setStyles()
        XCTAssertTrue(viewController.containerView.layer.cornerRadius == 5)
        XCTAssertTrue(viewController.villagerImageView.layer.cornerRadius == 5)
    }

    func testSetData() {
       // initial values

        XCTAssertEqual(viewController.personalityLabel.text, "Personality: -")
        XCTAssertEqual(viewController.catchPhraseLabel.text, "Catch Phrase: -")
        XCTAssertEqual(viewController.sayingLabel.text, "Saying: -")
        XCTAssertEqual(viewController.nameLabel.text, "-")
        XCTAssertEqual(viewController.speciesLabel.text, "Species: -")
        XCTAssertEqual(viewController.genderLabel.text, "Gender: -")
        XCTAssertEqual(viewController.hobbyLabel.text, "Hobby: -")
        XCTAssertEqual(viewController.birthdayLabel.text, "Birthday: -")

        // TO DO: figure out how to test combine results
        viewController.setData()

    }


}
