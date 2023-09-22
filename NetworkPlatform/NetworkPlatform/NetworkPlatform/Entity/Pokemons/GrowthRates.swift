//
//  GrowthRates.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Growth Rates
///
/// Growth rates are the speed with which Pokémon gain levels through experience. Check out Bulbapedia for greater detail.

public struct GrowthRate: Codable {
    public let descriptions: [Description]?
    public let formula: String?
    public let id: Int?
    public let levels: [GrowthRateExperienceLevel]?
    public let name: String?
    public let pokemonSpecies: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case descriptions, formula, id, levels, name
        case pokemonSpecies = "pokemon_species"
    }

    public static var repository = WrappedRepository<Self>()
}

public struct GrowthRateExperienceLevel: Codable {
    public let experience, level: Int?
}
