//
//  PokemonHabitat.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Habitats are generally different terrain Pokémon can be found in but can also be areas designated for rare or legendary Pokémon.

public struct PokemonHabitat: Codable {
    public let id: Int?
    public let name: String?
    public let names: [Name]?
    public let pokemonSpecies: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case pokemonSpecies = "pokemon_species"
        case name
        case names
        case id
    }

    public static var repository = WrappedRepository<Self>()
}
