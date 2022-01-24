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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        homeViewModel
            .getVillagers()
            .receive(on: DispatchQueue.main)
            .sink { res in
                print("data: \(res)")
            } receiveValue: { [weak self] (val) in
                self?.nameLabel.text = val.name["name-USen"] ?? "-"
                self?.birthdayLabel.text = val.birthday
                self?.personalityLabel.text = val.personality
                self?.speciesLabel.text = val.species
                self?.genderLabel.text = val.gender
                self?.hobbyLabel.text = val.hobby
                self?.catchPhraseLabel.text = val.catchPhrase
            }
            .store(in: &subscriptions)

        setInitialItems()
        setStyles()
    }

    func setInitialItems() {
        headingLabel.text = homeViewModel.heading

    }

    func setStyles() {
        headingLabel.textColor = .white
    }

}
