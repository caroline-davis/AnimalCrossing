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
    @IBOutlet weak var villagerImageView: UIImageView!

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
        villagerImageView.layer.cornerRadius = 5

    }

}
