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
                // To do: fix the image view url
//                self?.villagerImageView.send(val.imageUrl)

                self?.nameLabel.text = val.name["name-USen"] ?? "-"
                self?.birthdayLabel.text = "\(self?.homeViewModel.birthday ?? "") \(val.birthday)"
                self?.personalityLabel.text = "\(self?.homeViewModel.personality ?? "") \(val.personality)"
                self?.speciesLabel.text = "\(self?.homeViewModel.species ?? "") \(val.species)"
                self?.genderLabel.text = "\(self?.homeViewModel.gender ?? "") \(val.gender)"
                self?.hobbyLabel.text = "\(self?.homeViewModel.hobby ?? "") \(val.hobby)"
                self?.catchPhraseLabel.text = "\(self?.homeViewModel.catchPhrase ?? "") \(val.catchPhrase)"
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
