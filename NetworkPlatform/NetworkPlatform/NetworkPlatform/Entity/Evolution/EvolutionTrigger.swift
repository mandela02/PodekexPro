//
//  EvolutionTrigger.swift
//  NetworkPlatform
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation

struct EvolutionTrigger: Codable {
    let id: Int?
    let name: String?
    let names: [Name]?
    let pokemonSpecies: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}
