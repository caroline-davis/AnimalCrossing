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

    var villagerNumber: String {
        var number = ""
        for _ in 1...50 {
            number = String(Int.random(in: 1..<50))
        }
        return number
    }

    func villageUrl() -> URL {
        var number = ""
        for _ in 1...50 {
            number = String(Int.random(in: 1..<50))
        }
        return URL(string: "https://acnhapi.com/v1/villagers/\(number)") ?? URL(string:"https://acnhapi.com/v1/villagers/1")!
    }


    func getVillagers() -> AnyPublisher<Villager, Error> {

        let villagerPublisher = URLSession
            .shared
            .dataTaskPublisher(for: villageUrl())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveSubscription: { _ in
                DispatchQueue
                    .main
                    .async {
                        //                       add spinner here
                        print("loading...")
                    }
            })
            .map { $0.data }
            .decode(type: Villager.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        return villagerPublisher
    }
}
