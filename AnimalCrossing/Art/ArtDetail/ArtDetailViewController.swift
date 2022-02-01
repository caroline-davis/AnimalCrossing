//
//  ArtDetailViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 1/2/22.
//

import Foundation
import UIKit

class ArtDetailViewController: UIViewController {

    var artDetailViewModel: ArtDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }


}
