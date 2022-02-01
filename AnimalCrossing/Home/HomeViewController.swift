//
//  ViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 21/1/22.
//

import UIKit
import Combine
import SDWebImage

class HomeViewController: UIViewController {

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
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!

    var homeViewModel = HomeViewModel()
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true

        homeViewModel
            .getVillagers(spinner: spinnerView)
            .receive(on: DispatchQueue.main)
            .sink { res in
                switch res {
                case .finished:
                    self.spinnerView.stopAnimating()
                    self.spinnerView.isHidden = true
                case .failure (let error):
                    print(error)
                }
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
        containerView.layer.cornerRadius = 5
        villagerImageView.layer.cornerRadius = 5
    }

}
