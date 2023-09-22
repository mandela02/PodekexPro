//
//  Stat.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Poke Stats
///
/// Stats determine certain aspects of battles. Each Pokémon has a value for each stat which grows as they gain levels and can be altered momentarily by effects in battles.

public struct PokeStat: Codable {
    public let affectingMoves: MoveStatAffectSets
    public let affectingNatures: NatureStatAffectSets?
    public let characteristics: [APIResource]?
    public let gameIndex, id: Int?
    public let isBattleOnly: Bool?
    public let moveDamageClass: NamedAPIResource?
    public let name: String?
    public let names: [Name]?

    enum CodingKeys: String, CodingKey {
        case affectingMoves = "affecting_moves"
        case affectingNatures = "affecting_natures"
        case characteristics
        case gameIndex = "game_index"
        case id
        case isBattleOnly = "is_battle_only"
        case moveDamageClass = "move_damage_class"
        case name, names
    }

    public static var repository = WrappedRepository<Self>()
}


public struct NatureStatAffectSets: Codable {
    public let increase: NamedAPIResource?
    public let decrease: NamedAPIResource?
}

public struct MoveStatAffectSets: Codable {
    public let increase: MoveStatAffect?
    public let decrease: MoveStatAffect?
}

public struct MoveStatAffect: Codable {
    public let change: Int?
    public let move: NamedAPIResource?
}

