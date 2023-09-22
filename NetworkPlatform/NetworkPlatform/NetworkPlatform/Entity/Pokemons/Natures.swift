//
//  Natures.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Natures
///
/// Natures influence how a Pokémon's stats grow. See Bulbapedia for greater detail.

public struct Nature: Codable {
    public let id: Int?
    public let decreasedStat, hatesFlavor: NamedAPIResource?
    public let increasedStat, likesFlavor: NamedAPIResource?
    public let moveBattleStylePreferences: [MoveBattleStylePreference]?
    public let name: String?
    public let names: [Name]?
    public let pokeathlonStatChanges: [NatureStatChange]?

    enum CodingKeys: String, CodingKey {
        case decreasedStat = "decreased_stat"
        case hatesFlavor = "hates_flavor"
        case id
        case increasedStat = "increased_stat"
        case likesFlavor = "likes_flavor"
        case moveBattleStylePreferences = "move_battle_style_preferences"
        case name, names
        case pokeathlonStatChanges = "pokeathlon_stat_changes"
    }

    public static var repository = WrappedRepository<Self>()
}

public struct MoveBattleStylePreference: Codable {
    public let highHPPreference, lowHPPreference: Int?
    public let moveBattleStyle: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case highHPPreference = "high_hp_preference"
        case lowHPPreference = "low_hp_preference"
        case moveBattleStyle = "move_battle_style"
    }
}

public struct NatureStatChange: Codable {
    public let maxChange: Int?
    public let pokeathlonStat: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case maxChange = "max_change"
        case pokeathlonStat = "pokeathlon_stat"
    }
}
