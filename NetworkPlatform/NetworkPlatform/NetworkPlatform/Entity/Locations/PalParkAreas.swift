//
//  PalParkAreas.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct PalParkArea: Codable {
    let id: Int?
    let name: String?
    let names: [Name]?
    let pokemonEncounters: [PalParkEncounterSpecies]?

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonEncounters = "pokemon_encounters"
    }
}


public struct PalParkEncounterSpecies: Codable {
    public let baseScore: Int?
    public let pokemonSpecies: NamedAPIResource?
    public let rate: Int?

    enum CodingKeys: String, CodingKey {
        case baseScore = "base_score"
        case pokemonSpecies = "pokemon_species"
        case rate
    }
}

