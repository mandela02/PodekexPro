//
//  Genders.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Genders
///
/// Genders were introduced in Generation II for the purposes of breeding Pokémon but can also result in visual differences or even different evolutionary lines. Check out Bulbapedia for greater detail.
public struct Gender: Codable {
    public let id: Int?
    public let name: String?
    public let pokemonSpeciesDetails: [PokemonSpeciesGender]?
    public let requiredForEvolution: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pokemonSpeciesDetails = "pokemon_species_details"
        case requiredForEvolution = "required_for_evolution"
    }
    
    public static var repository = WrappedRepository<Self>()
}

public struct PokemonSpeciesGender: Codable {
    public let pokemonSpecies: NamedAPIResource?
    public let rate: Int?

    enum CodingKeys: String, CodingKey {
        case pokemonSpecies = "pokemon_species"
        case rate
    }
}
