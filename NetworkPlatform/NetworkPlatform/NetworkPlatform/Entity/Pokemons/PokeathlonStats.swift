//
//  PokeathlonStats.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import Common
import DataLayer

/// Pokeathlon Stats
///
/// Pokeathlon Stats are different attributes of a Pokémon's performance in Pokéathlons. In Pokéathlons, competitions happen on different courses; one for each of the different Pokéathlon stats. See Bulbapedia for greater detail.
public struct PokeathlonStat: Codable {
    public let affectingNatures: NaturePokeathlonStatAffectSets?
    public let id: Int?
    public let name: String?
    public let names: [Name]?

    enum CodingKeys: String, CodingKey {
        case affectingNatures = "affecting_natures"
        case id, name, names
    }

    public static var repository = WrappedRepository<Self>()
}

public struct NaturePokeathlonStatAffect: Codable {
    public let maxChange: Int?
    public let nature: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case maxChange = "max_change"
        case nature
    }
}

public struct NaturePokeathlonStatAffectSets: Codable {
    public let decrease, increase: [NaturePokeathlonStatAffect]?
}
