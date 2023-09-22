//
//  EggGroups.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Egg Groups
/// 
/// Egg Groups are categories which determine which Pokémon are able to interbreed. Pokémon may belong to either one or two Egg Groups. Check out Bulbapedia for greater detail.
public struct EggGroups: Codable {
    let id: Int?
    let name: String?
    let names: [Name]?
    let pokemonSpecies: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }

    public static var repository = WrappedRepository<Self>()
}
