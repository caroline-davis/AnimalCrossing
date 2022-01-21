//
//  VillagerRequest.swift
//  AnimalCrossing
//
//  Created by Caroline Davis on 21/1/22.
//

import Foundation

public struct Villager: Codable {
//    public var id: String
//    public var name: String
//    public var birthday: String
    public var personality: String
//    public var species: String
//    public var gender: String
//    public var hobby: String

    public init(personality: String) {
// id: String,
//    name: String,
//                personality: String,
//                species: String,
//                gender: String,
//                hobby: String) {
//        self.id = id
//        self.name = name
//        self.birthday = birthday
        self.personality = personality
//        self.species = species
//        self.gender = gender
//        self.hobby = hobby
    }
}
