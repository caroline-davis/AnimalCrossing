//
//  Art.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 27/1/22.
//

import Foundation

public struct Art: Decodable {
    public var id: Int
    public var name: [String: String]
    public var hasFake: Bool
    public var buyPrice: Int
    public var sellPrice: Int
    public var imageUrl: String
    public var imageDescription: String

    enum CodingKeys: String, CodingKey {
        case buyPrice = "buy-price"
        case sellPrice = "sell-price"
        case imageUrl = "image_uri"
        case imageDescription = "museum-desc"
        case id
        case name
        case hasFake
    }

    public init(id: Int,
                name: [String: String],
                hasFake: Bool,
                buyPrice: Int,
                sellPrice: Int,
                imageUrl: String,
                imageDescription: String) {
        self.id = id
        self.name = name
        self.hasFake = hasFake
        self.buyPrice = buyPrice
        self.sellPrice = sellPrice
        self.imageUrl = imageUrl
        self.imageDescription = imageDescription
    }
}

struct ArtResponse: Decodable {

    let artworksArray: [Art]

    // Define DynamicCodingKeys type needed for creating
     // decoding container from JSONDecoder
    private struct DynamicCodingKeys: CodingKey {

        // Use for string-keyed dictionary
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        // Use for integer-keyed dictionary
        var intValue: Int?
        init?(intValue: Int) {
            // We are not using this, thus just return nil
            return nil
        }
    }

    init(from decoder: Decoder) throws {
        // 1
        // Create a decoding container using DynamicCodingKeys
        // The container will contain all the JSON first level key
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var tempArray = [Art]()

        // 2
        // Loop through each key (Art name) in container
        for key in container.allKeys {
            // Decode Art using key & keep decoded Art object in tempArray
            print("this is the key", key)
            let decodedObject = try container.decode(Art.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
            print(tempArray, "tempArray")
        }
        // 3
        // Finish decoding all Art objects. Thus assign tempArray to array.
            artworksArray = tempArray

    }
}

// EXAMPLE RESPONSE:
//
//{
//   "id":11,
//   "file-name":"famous_painting",
//   "name":{
//      "name-USen":"famous painting",
//      "name-EUen":"famous painting",
//      "name-EUde":"Berühmtgemälde",
//      "name-EUes":"retrato italiano",
//      "name-USes":"retrato italiano",
//      "name-EUfr":"toile célèbre",
//      "name-USfr":"toile célèbre",
//      "name-EUit":"quadro famoso",
//      "name-EUnl":"beroemde schilderij",
//      "name-CNzh":"有名的名画",
//      "name-TWzh":"有名的名畫",
//      "name-JPja":"ゆうめいなめいが",
//      "name-KRko":"유명한 명화",
//      "name-EUru":"знаменитая картина"
//   },
//   "hasFake":true,
//   "buy-price":4980,
//   "sell-price":1245,
//   "image_uri":"https://acnhapi.com/v1/images/art/famous_painting",
//   "museum-desc":"The world's most famous smile. It's said that da Vinci kept this painting for himself until the very end...Given its power to beguile visitors all these years later, it's easy to see why."
//}
