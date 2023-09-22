//
//  PokemonColor.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import Common
import DataLayer

/// Pokemon Colors
///
/// Colors used for sorting Pokémon in a Pokédex. The color listed in the Pokédex is usually the color most apparent or covering each Pokémon's body. No orange category exists; Pokémon that are primarily orange are listed as red or brown.

public struct PokemonColor: Codable {
    public let id: Int?
    public let name: String?
    public let names: [Name]?
    public let pokemonSpecies: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }

    public static var repository = WrappedRepository<Self>()
}

