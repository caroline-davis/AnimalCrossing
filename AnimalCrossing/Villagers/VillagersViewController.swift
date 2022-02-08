//
//  VillagersCollectionViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 8/2/22.
//

import UIKit
import Combine

class VillagersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!

    var villagersViewModel = VillagersViewModel()
    var subscriptions: [AnyCancellable] = []
    var models = [Villagers]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        collectionView.register(UINib(nibName: "VillagersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: VillagersCollectionViewCell.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        villagersViewModel
            .getVillagers(spinner: spinnerView)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    self.spinnerView.stopAnimating()
                    self.spinnerView.isHidden = true
                case .failure:
                    print("error")
                }
            } receiveValue: { [weak self] value in
                self?.models = value.villagersArray
                self?.collectionView.reloadData()
            }
            .store(in: &subscriptions)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VillagersCollectionViewCell.identifier, for: indexPath) as? VillagersCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: models[indexPath.row])

        return cell
    }
}
