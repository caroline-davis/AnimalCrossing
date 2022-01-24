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
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        homeViewModel
            .getVillagers()
            .receive(on: DispatchQueue.main)
            .sink { res in
                print("data: \(res)")
            } receiveValue: { [weak self] (val) in
                // Note: not sure if best way with Combine but couldnt figure out how to change 1 data type to UIImage, with the rest as data
                let imgURL = URL(string: val.imageUrl)!
                let data = try? Data(contentsOf: imgURL)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self?.villagerImageView.image = image
                }

                self?.nameLabel.text = val.name["name-USen"] ?? "-"
                self?.birthdayLabel.text = "\(self?.homeViewModel.birthday ?? "") \(val.birthday)"
                self?.personalityLabel.text = "\(self?.homeViewModel.personality ?? "") \(val.personality)"
                self?.speciesLabel.text = "\(self?.homeViewModel.species ?? "") \(val.species)"
                self?.genderLabel.text = "\(self?.homeViewModel.gender ?? "") \(val.gender)"
                self?.hobbyLabel.text = "\(self?.homeViewModel.hobby ?? "") \(val.hobby)"
                self?.catchPhraseLabel.text = "\(self?.homeViewModel.catchPhrase ?? "") \(val.catchPhrase.capitalized)"
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
        containerView.layer.cornerRadius = 5
        villagerImageView.layer.cornerRadius = 5


    }

}
