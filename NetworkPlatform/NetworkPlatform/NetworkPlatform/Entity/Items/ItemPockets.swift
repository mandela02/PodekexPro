//
//  ItemPockets.swift
//  NetworkPlatform
//
//  Created by TriBQ on 20/09/2023.
//

import Foundation

public struct Item: Codable {
    public let attributes: [NamedAPIResource]?
    public let babyTriggerFor: APIResource?
    public let category: NamedAPIResource?
    public let cost: Int?
    public let effectEntries: [VerboseEffect]?
    public let flavorTextEntries: [VersionGroupFlavorText]?
    public let flingEffect: NamedAPIResource?
    public let flingPower: Int?
    public let gameIndices: [GenerationGameIndex]?
    public let heldByPokemon: [ItemHolderPokemon]?
    public let id: Int?
    public let machines: [MachineVersionDetail]?
    public let name: String?
    public let names: [Name]?
    public let sprites: ItemSprites?

    enum CodingKeys: String, CodingKey {
        case attributes
        case babyTriggerFor = "baby_trigger_for"
        case category, cost
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case flingEffect = "fling_effect"
        case flingPower = "fling_power"
        case gameIndices = "game_indices"
        case heldByPokemon = "held_by_pokemon"
        case id, machines, name, names, sprites
    }
}


public struct ItemPocket: Codable {
    public let id: Int?
    public let name: String?
    public let categories: [NamedAPIResource]?
    public let names: [Name]?
}

public struct ItemFlingEffect: Codable {
    public let id: Int?
    public let name: String?
    public let effectEntries: [Effect]?
    public let items: [NamedAPIResource]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case effectEntries = "effect_entries"
        case items
    }
}

public struct ItemCategory: Codable {
    public let id: Int?
    public let name: String?
    public let names: [Name]?
    public let items: [NamedAPIResource]?
    public let pocket: NamedAPIResource?
}

public struct ItemAttribute: Codable {
    public let id: Int?
    public let name: String?
    public let names: [Name]?
    public let items: [NamedAPIResource]?
    public let descriptions: [Description]?
}

public struct ItemHolderPokemonVersionDetail: Codable {
    public let rarity: Int?
    public let version: NamedAPIResource?
}

public struct ItemSprites: Codable {
    public let `default`: String?
}

public struct ItemHolderPokemon: Codable {
    public let pokemon: NamedAPIResource?
    public let versionDetails: VersionEncounterDetail?

    enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}

