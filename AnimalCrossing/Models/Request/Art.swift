//
//  Art.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 27/1/22.
//

import Foundation

public struct Art: Codable {
    public var id: Int
    public var name: [String: String]
    public var hasFake: Bool
    public var buyPrice: String
    public var sellPrice: String
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
                buyPrice: String,
                sellPrice: String,
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
