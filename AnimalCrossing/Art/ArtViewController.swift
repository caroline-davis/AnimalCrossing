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

    var artViewModel = ArtViewModel()
    var subscriptions = Set<AnyCancellable>()
//    var artworks = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ArtTableViewCell", bundle: nil), forCellReuseIdentifier: ArtTableViewCell.identifier)

        tableView.dataSource = self

        setStyles()

        artViewModel
            .getArt()
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    print ("finished")
                case .failure:
                    print(result, "here")
                    print("error")
                }
            } receiveValue: { [weak self] value in
                print("hello")
                print(value)
//                self?.artworks = value
                self?.tableView.reloadData()
            }
            .store(in: &subscriptions)


        
    }

    func setStyles() {
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtTableViewCell.identifier) as! ArtTableViewCell
//        cell.configure(with: animals[indexPath.row], imageName: "gear")
        cell.layoutMargins = UIEdgeInsets.zero

        return cell
    }
    


}
