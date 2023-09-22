//
//  Pokemon.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Pokemon
/// 
/// Pokémon are the creatures that inhabit the world of the Pokémon games. They can be caught using Pokéballs and trained by battling with other Pokémon. Each Pokémon belongs to a specific species but may take on a variant which makes it differ from other Pokémon of the same species, such as base stats, available abilities and typings. See Bulbapedia for greater detail.
public struct Pokemon: Codable {
    public let id: Int?

    public let abilities: [PokemonAbility]?
    public let baseExperience: Int?
    public let forms: [NamedAPIResource]?
    public let gameIndices: [VersionGameIndex]?
    public let height: Int?
    public let heldItems: [PokemonHeldItem]?
    public let isDefault: Bool?
    public let locationAreaEncounters: String?
    public let moves: [PokemonMove]?
    public let name: String?
    public let order: Int?
    public let pastTypes: [PokemonTypePast]?
    public let species: NamedAPIResource?
    public let sprites: PokemonSprites?
    public let stats: [PokemonStat]?
    public let types: [PokemonType]?
    public let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }

    public static var repository = WrappedRepository<Self>()
}

public struct PokemonSprites: Codable {
    public let backDefault: String?
    public let backFemale: String?
    public let backShiny: String?
    public let backShinyFemale: String?
    public let frontDefault: String?
    public let frontFemale: String?
    public let frontShiny: String?
    public let frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

public struct PokemonStat: Codable {
    public let baseStat, effort: Int?
    public let stat: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

public struct PokemonMoveVersion: Codable {
    public let levelLearnedAt: Int?
    public let moveLearnMethod, versionGroup: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

public struct PokemonMove: Codable {
    public let move: NamedAPIResource?
    public let versionGroupDetails: [PokemonMoveVersion]?

    enum CodingKeys: String, CodingKey {
        case move = "move"
        case versionGroupDetails = "version_group_details"
    }
}

public struct PokemonHeldItemVersion: Codable {
    public let version: NamedAPIResource?
    public let rarity: Int?
}

public struct PokemonHeldItem: Codable {
    public let item: NamedAPIResource?
    public let versionDetails: [PokemonHeldItemVersion]?

    enum CodingKeys: String, CodingKey {
        case item = "item"
        case versionDetails = "version_details"
    }
}

public struct PokemonTypePast: Codable {
    public let generation: NamedAPIResource?
    public let types: [PokemonType]?
}

public struct PokemonFormType: Codable {
    public let slot: Int?
    public let type: NamedAPIResource?
}

public struct PokemonType: Codable {
    public let slot: Int?
    public let type: NamedAPIResource?
}

public struct PokemonAbility: Codable {
    public let isHidden: Bool?
    public let slot: Int?
    public let ability: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
        case ability
    }
}
