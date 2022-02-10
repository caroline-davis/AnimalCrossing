//
//  VillagersDetailViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 9/2/22.
//

import UIKit

class VillagersDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var villagerContainerImageView: UIImageView!
    @IBOutlet weak var villagerImageView: UIImageView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var sayingLabel: UILabel!

    @IBOutlet weak var textContainerStackView: UIStackView!

    @IBOutlet weak var speciesLabel: UILabel!

    @IBOutlet weak var catchPhraseLabel: UILabel!
    var villagersDetailViewModel: VillagersDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
        setInitialItems()

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    func setInitialItems() {
        villagersDetailViewModel?.setImage(villagerImageView: villagerImageView)
        nameLabel.text = villagersDetailViewModel?.name
        personalityLabel.text = villagersDetailViewModel?.personality
        sayingLabel.text = villagersDetailViewModel?.saying
        catchPhraseLabel.text = villagersDetailViewModel?.catchPhrase
        speciesLabel.text = villagersDetailViewModel?.species
        villagerImageView.layer.cornerRadius = 5
        villagerImageView.clipsToBounds = true
        textContainerStackView.layer.cornerRadius = 5

    }

}
