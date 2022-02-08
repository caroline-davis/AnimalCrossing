//
//  ArtViewController.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 27/1/22.
//

import UIKit
import Combine

class ArtViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!

    var artViewModel = ArtViewModel()
    var subscriptions: [AnyCancellable] = []
    var models = [Art]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true

        tableView.register(UINib(nibName: "ArtTableViewCell", bundle: nil), forCellReuseIdentifier: ArtTableViewCell.identifier)

        tableView.dataSource = self
        tableView.delegate = self

        getData()
        setStyles()
    }

    func setStyles() {
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
    }

    func getData() {
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtTableViewCell.identifier) as? ArtTableViewCell else {
            fatalError()
        }
        cell.configure(with: models[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let items = models[indexPath.row]

        if let vc = UIStoryboard(name: "ArtDetail", bundle: nil).instantiateViewController(identifier: "ArtDetailViewController") as? ArtDetailViewController {

            let artDetailViewModel = ArtDetailViewModel(selectedItem: items)
            vc.artDetailViewModel = artDetailViewModel
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
