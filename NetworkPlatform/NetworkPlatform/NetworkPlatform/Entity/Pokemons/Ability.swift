//
//  Ability.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Abilities
///
/// Abilities provide passive effects for Pokémon in battle or in the overworld. Pokémon have multiple possible abilities but can have only one ability at a time. Check out Bulbapedia for greater detail.
public struct Ability: Codable {
    public let id: Int?
    public let name: String?
    public let isMainSeries: Bool?
    public let generation: NamedAPIResource?
    public let names: [Name]?
    public let effectEntries: [VerboseEffect]?
    public let effectChanges: [AbilityEffectChange]?
    public let flavorTextEntries: [AbilityFlavorText]?
    public let pokemon: [AbilityPokemon]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isMainSeries = "is_main_series"
        case generation
        case names
        case effectEntries = "effect_entries"
        case effectChanges = "effect_changes"
        case flavorTextEntries = "flavor_text_entries"
        case pokemon
    }

    public static var repository = WrappedRepository<Self>()
}

public struct AbilityPokemon: Codable {
    public let isHidden: Bool?
    public let slot: Int?
    public let pokemon: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
        case pokemon
    }
}

public struct AbilityFlavorText: Codable {
    public let flavorText: String?
    public let language: NamedAPIResource?
    public let versionGroup: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }
}

public struct AbilityEffectChange: Codable {
    public let effectEntries: [Effect]?
    public let versionGroup: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case versionGroup = "version_group"
    }
}
