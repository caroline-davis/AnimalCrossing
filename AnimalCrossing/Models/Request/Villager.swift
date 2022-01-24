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

    enum CodingKeys: String, CodingKey {
        case catchPhrase = "catch-phrase"
        case birthday = "birthday-string"
        case id
        case name
        case personality
        case species
        case gender
        case hobby
    }

    public init(personality: String,
                birthday: String,
                id: Int,
                gender: String,
                species: String,
                hobby: String,
                name: [String: String],
                catchPhrase: String) {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.personality = personality
        self.species = species
        self.gender = gender
        self.hobby = hobby
        self.catchPhrase = catchPhrase
    }
}
