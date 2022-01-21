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

    // https://acnhapi.com/v1/villagers/{villagerID}

    let villagerURL = URL(string: "https://acnhapi.com/v1/villagers/11")

    func getVillagers() -> AnyPublisher<Villager, Error> {

        let villagerPublisher = URLSession
            .shared
            .dataTaskPublisher(for: villagerURL!)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveSubscription: { _ in
                DispatchQueue
                    .main
                    .async {
//                       add spinner here
                    }
            })
            .map { $0.data }
            .decode(type: Villager.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        return villagerPublisher
    }
}
