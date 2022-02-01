//
//  Villager.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 21/1/22.
//

import Foundation

public struct Villager: Codable {
    public var id: Int
    public var name: [String: String]
    public var birthday: String
    public var personality: String
    public var species: String
    public var gender: String
    public var hobby: String
    public var catchPhrase: String
    public var imageUrl: String
    public var saying: String

    enum CodingKeys: String, CodingKey {
        case catchPhrase = "catch-phrase"
        case birthday = "birthday-string"
        case imageUrl = "image_uri"
        case id
        case name
        case personality
        case species
        case gender
        case hobby
        case saying
    }

    public init(personality: String,
                birthday: String,
                id: Int,
                gender: String,
                species: String,
                hobby: String,
                name: [String: String],
                catchPhrase: String,
                imageUrl: String,
                saying: String) {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.personality = personality
        self.species = species
        self.gender = gender
        self.hobby = hobby
        self.catchPhrase = catchPhrase
        self.imageUrl = imageUrl
        self.saying = saying
    }
}

// EXAMPLE RESPONSE:
//
//{
//   "id":11,
//   "file-name":"bea03",
//   "name":{
//      "name-USen":"Chow",
//      "name-EUen":"Chow",
//      "name-EUde":"Chang",
//      "name-EUes":"Pando",
//      "name-USes":"Pando",
//      "name-EUfr":"Chulin",
//      "name-USfr":"Chulin",
//      "name-EUit":"Chowchow",
//      "name-EUnl":"Chow",
//      "name-CNzh":"朝阳",
//      "name-TWzh":"朝陽",
//      "name-JPja":"チャウヤン",
//      "name-KRko":"츄양",
//      "name-EUru":"Чау"
//   },
//   "personality":"Cranky",
//   "birthday-string":"July 22nd",
//   "birthday":"22/7",
//   "species":"Bear",
//   "gender":"Male",
//   "subtype":"B",
//   "hobby":"Fitness",
//   "catch-phrase":"aiya",
//   "icon_uri":"https://acnhapi.com/v1/icons/villagers/11",
//   "image_uri":"https://acnhapi.com/v1/images/villagers/11",
//   "bubble-color":"#f2bdc7",
//   "text-color":"#634b4b",
//   "saying":"All good things must come to an end.",
//   "catch-translations":{
//      "catch-USen":"aiya",
//      "catch-EUen":"aiya",
//      "catch-EUde":"hiijaa",
//      "catch-EUes":"ándale-oso",
//      "catch-USes":"grinchu",
//      "catch-EUfr":"lala",
//      "catch-USfr":"lala",
//      "catch-EUit":"ehilà",
//      "catch-EUnl":"kiai",
//      "catch-CNzh":"有喔",
//      "catch-TWzh":"有喔",
//      "catch-JPja":"アルヨ",
//      "catch-KRko":"그럼",
//      "catch-EUru":"ай-яй"
//   }
//}
