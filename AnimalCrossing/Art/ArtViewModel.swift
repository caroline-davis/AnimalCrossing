//
//  ArtViewModel.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 28/1/22.
//

import Foundation
import UIKit
import Combine

struct Root: Decodable {
    let artworks: [Art]

    struct DetailKey: CodingKey {
            var stringValue: String
            var intValue: Int?
            init?(stringValue: String) {
               self.stringValue = stringValue
            }
            init?(intValue: Int) {
                self.stringValue = "\(intValue)"
                self.intValue = intValue
            }
        }

    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: DetailKey.self)

            var artworks = [String: Art]()
            for key in container.allKeys {
                print(key)
                if let model = try? container.decode(Art.self, forKey: key) {
                    print(model)
                    artworks[key.stringValue] = model
                }
            }

           // self.artworks = []
//        }
        self.artworks = []
    }
//    init(artworks: Any) {
//        self.artworks = []
//        print(artworks)
//    }
}

class ArtViewModel {

    let url = URL(string: "https://acnhapi.com/v1/art/")!

    func getArt() -> AnyPublisher<Root, Error> {

        let artPublisher = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveSubscription: { _ in
                DispatchQueue
                    .main
                    .async {
//                        spinner.startAnimating()
                    }
            })
            .map {
                print("here", $0.data)
                return $0.data
            }
            .decode(type: Root.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

        return artPublisher
    }
}
