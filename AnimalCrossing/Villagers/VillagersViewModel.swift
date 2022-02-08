//
//  VillagersViewModel.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 8/2/22.
//

import Foundation
import UIKit
import Combine

class VillagersViewModel {


    let url = URL(string: "https://acnhapi.com/v1/villagers/")!


    func getVillagers(spinner: UIActivityIndicatorView) -> AnyPublisher<VillagersResponse, Error> {

        let villagersPublisher = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveSubscription: { _ in
                DispatchQueue
                    .main
                    .async {
                        spinner.startAnimating()
                    }
            })
            .map({ $0.data })
            .decode(type: VillagersResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        return villagersPublisher

    }
}
