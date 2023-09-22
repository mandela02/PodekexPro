//
//  SharedEntity.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

public struct NamedAPIResourceList: Codable {
    public let count: Int?
    public let next: String?
    public let previous: String?
    public let results: [NamedAPIResource]?

    public static var repository = WrappedRepository<Self>()
}

public struct APIResource: Codable {
    public let url: String?
}

public struct NamedAPIResource: Codable {
    public let url: String?
    public let name: String?
}

public struct Description: Codable {
    public let description: String?
    public let language: NamedAPIResource?
}

public struct Effect: Codable {
    public let effect: String?
    public let language: NamedAPIResource?
}

public struct Encounter: Codable {
    public let minLevel: Int?
    public let maxLevel: Int?
    public let conditionValues: [NamedAPIResource]?
    public let change: Int?
    public let method: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case minLevel = "min_level"
        case maxLevel = "max_level"
        case change
        case conditionValues = "condition_values"
        case method
    }
}

public struct FlavorText: Codable {
    public let flavorText: String?
    public let language: NamedAPIResource
    public let version: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case version
    }
}

public struct GenerationGameIndex: Codable {
    public let gameIndex: Int?
    public let generation: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
}

public struct MachineVersionDetail: Codable {
    public let machine: APIResource?
    public let versionGroup: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case machine = "game_index"
        case versionGroup = "version_group"
    }
}

public struct Name: Codable {
    public let name: String?
    public let language: NamedAPIResource?
}

public struct VerboseEffect: Codable {
    public let effect: String?
    public let shortEffect: String?
    public let language: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
        case language
    }
}

public struct VersionEncounterDetail: Codable {
    public let version: NamedAPIResource?
    public let maxChance: Int?
    public let encounterDetails: [Encounter]?

    enum CodingKeys: String, CodingKey {
        case version
        case maxChance = "max_chance"
        case encounterDetails = "encounter_details"
    }
}

public struct VersionGameIndex: Codable {
    public let gameIndex: Int?
    public let version: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

public struct VersionGroupFlavorText: Codable {
    public let text: String?
    public let language: NamedAPIResource?
    public let versionGroup: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case text
        case language
        case versionGroup = "version_group"
    }
}
