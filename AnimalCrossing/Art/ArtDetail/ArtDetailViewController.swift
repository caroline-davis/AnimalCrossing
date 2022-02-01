//
//  ArtDetailViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 1/2/22.
//

import Foundation
import UIKit

class ArtDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artName: UILabel!
    @IBOutlet weak var artDescription: UILabel!
    @IBOutlet weak var buyPrice: UILabel!
    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var hasFake: UILabel!

    var artDetailViewModel: ArtDetailViewModel?

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
        artName.text = artDetailViewModel?.name
        artDescription.text = artDetailViewModel?.imageDescription
        hasFake.text = artDetailViewModel?.hasFake
        buyPrice.text = artDetailViewModel?.buyPrice
        sellPrice.text = artDetailViewModel?.sellPrice

    }


}
