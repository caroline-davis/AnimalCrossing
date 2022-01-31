//
//  ArtViewModel.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 28/1/22.
//

import Foundation
import UIKit
import Combine

class ArtViewModel {

    let url = URL(string: "https://acnhapi.com/v1/art/")!

    func getArt(spinner: UIActivityIndicatorView) -> AnyPublisher<ArtResponse, Error> {

        let artPublisher = URLSession
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
            .map {
                print("the data:", $0.data)
                return $0.data
            }
            .decode(type: ArtResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        return artPublisher
    }
}
