//
//  Move.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct Move: Codable {
    let accuracy: Int?
    let contestCombos: ContestComboSets?
    let contestEffect: APIResource?
    let contestType, damageClass: NamedAPIResource?
    let effectChance: Int?
    let effectChanges: [AbilityEffectChange]?
    let effectEntries: [VerboseEffect]?
    let flavorTextEntries: [MoveFlavorText]?
    let generation: NamedAPIResource?
    let id: Int?
    let learnedByPokemon: [NamedAPIResource]?
    let machines: [MachineVersionDetail]?
    let meta: MoveMetaData?
    let name: String?
    let names: [Name]?
    let pastValues: [PastMoveStatValues]?
    let power, pp, priority: Int?
    let statChanges: [MoveStatAffect]?
    let superContestEffect: APIResource?
    let target, type: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case accuracy
        case contestCombos = "contest_combos"
        case contestEffect = "contest_effect"
        case contestType = "contest_type"
        case damageClass = "damage_class"
        case effectChance = "effect_chance"
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation, id
        case learnedByPokemon = "learned_by_pokemon"
        case machines, meta, name, names
        case pastValues = "past_values"
        case power, pp, priority
        case statChanges = "stat_changes"
        case superContestEffect = "super_contest_effect"
        case target, type
    }
}


public struct PastMoveStatValues: Codable {
    public let accuracy: Int?
    public let effectChance: Int?
    public let power: Int?
    public let pp: Int?
    public let effectEntries: [VerboseEffect]?
    public let type: NamedAPIResource?
    public let versionGroup: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case accuracy
        case effectChance = "effect_chance"
        case power
        case pp
        case effectEntries = "effect_entries"
        case type
        case versionGroup = "version_group"
    }
}

public struct MoveStatChange: Codable {
    public let change: Int?
    public let stat: NamedAPIResource?
}

public struct MoveMetaData: Codable {
    let ailment: NamedAPIResource?
    let ailmentChance: Int?
    let category: NamedAPIResource?
    let critRate, drain, flinchChance, healing: Int?
    let maxHits, maxTurns, minHits, minTurns: Int?
    let statChance: Int?

    enum CodingKeys: String, CodingKey {
        case ailment
        case ailmentChance = "ailment_chance"
        case category
        case critRate = "crit_rate"
        case drain
        case flinchChance = "flinch_chance"
        case healing
        case maxHits = "max_hits"
        case maxTurns = "max_turns"
        case minHits = "min_hits"
        case minTurns = "min_turns"
        case statChance = "stat_chance"
    }
}

public struct MoveFlavorText: Codable {
    let flavorText: String?
    let language, versionGroup: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }
}

public struct ContestComboDetail: Codable {
    let useAfter: [NamedAPIResource]?
    let useBefore: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case useAfter = "use_after"
        case useBefore = "use_before"
    }
}

public struct ContestComboSets: Codable {
    let normal: ContestComboDetail
    let `super`: ContestComboDetail
}

