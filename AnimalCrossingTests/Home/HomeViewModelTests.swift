//
//  AnimalCrossingTests.swift
//  AnimalCrossingTests
//
//  Created by Caroline Davis on 11/2/22.
//

@testable import AnimalCrossing
import XCTest

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!

    override func setUp() {
        super.setUp()

        viewModel = HomeViewModel()
    }

    func testVillagerUrl() {

        let address = viewModel.villagerUrl().absoluteString
        let array = address.split(separator: "/")
        let end = array.endIndex - 1
        let urlNumber = array[end]

        XCTAssertTrue(Int(urlNumber)! < 390)
        XCTAssertTrue(Int(urlNumber)! > 0)
        XCTAssertNotEqual(URL(string:"https://acnhapi.com/v1/villagers/"), viewModel.villagerUrl())
    }


}
