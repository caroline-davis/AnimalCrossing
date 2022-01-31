//
//  ArtViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 27/1/22.
//

import UIKit
import Combine

class ArtViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!

    var artViewModel = ArtViewModel()
    var subscriptions: [AnyCancellable] = []
    var models = [Art]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ArtTableViewCell", bundle: nil), forCellReuseIdentifier: ArtTableViewCell.identifier)

        tableView.dataSource = self

        setStyles()

        artViewModel
            .getArt(spinner: spinnerView)
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
                self?.models = value.artworksArray
                self?.tableView.reloadData()
            }
            .store(in: &subscriptions)
    }

    func setStyles() {
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(models.count)
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtTableViewCell.identifier) as? ArtTableViewCell else {
            fatalError()
        }

        cell.configure(with: models[indexPath.row])
        cell.layoutMargins = UIEdgeInsets.zero

        return cell
    }
}
