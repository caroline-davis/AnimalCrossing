//
//  ViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 21/1/22.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    var homeViewModel = HomeViewModel()
    var subscriptions = Set<AnyCancellable>()

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var villagerImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialItems()
        setStyles()

        homeViewModel
            .getVillagers()
            .receive(on: DispatchQueue.main)
            .sink { res in
                print("data: \(res)")
            } receiveValue: { [weak self] (val) in
                print("this", val)
            }
            .store(in: &subscriptions)
    }

    func setInitialItems() {
        headingLabel.text = homeViewModel.heading
    }

    func setStyles() {
        headingLabel.textColor = .white
    }


}

