//
//  PokemonShape.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Shapes used for sorting Pokémon in a Pokédex.
public struct PokemonShape: Codable {
    let awesomeNames: [AwesomeName]?
    let id: Int?
    let name: String?
    let names: [Name]?
    let pokemonSpecies: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case awesomeNames = "awesome_names"
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }

    public static var repository = WrappedRepository<Self>()
}

public struct AwesomeName: Codable {
    let awesomeName: String?
    let language: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case awesomeName = "awesome_name"
        case language
    }
}
