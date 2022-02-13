//
//  HomeViewModel.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 21/1/22.
//

import Foundation
import UIKit
import Combine

class HomeViewModel {

    var heading = "Animal Crossing"
    var birthday = "Birthday:"
    var personality = "Personality:"
    var species = "Species:"
    var gender = "Gender:"
    var hobby = "Hobby:"
    var catchPhrase = "Catch Phrase:"
    var saying = "Saying:"

    func villagerUrl() -> URL {
        var number = 0
        for _ in 1...390 {
            number = Int.random(in: 1..<390)
        }
        return URL(string: "https://acnhapi.com/v1/villagers/\(number)") ?? URL(string:"https://acnhapi.com/v1/villagers/1")!
    }

    func getVillager(spinner: UIActivityIndicatorView) -> AnyPublisher<Villager, Error> {

        let villagerPublisher = URLSession
            .shared
            .dataTaskPublisher(for: villagerUrl())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveSubscription: { _ in
                DispatchQueue
                    .main
                    .async {
                        spinner.startAnimating()
                    }
            })
            .map { $0.data }
            .decode(type: Villager.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        return villagerPublisher
    }
}
