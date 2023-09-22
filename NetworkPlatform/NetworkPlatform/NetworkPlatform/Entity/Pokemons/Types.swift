//
//  Types.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Types are properties for Pokémon and their moves. Each type has three properties: which types of Pokémon it is super effective against, which types of Pokémon it is not very effective against, and which types of Pokémon it is completely ineffective against.
public struct PokeType: Codable {
    public let damageRelations: TypeRelations?
    public let gameIndices: [GenerationGameIndex]?
    public let generation: NamedAPIResource?
    public let id: Int?
    public let moveDamageClass: NamedAPIResource?
    public let moves: [NamedAPIResource]?
    public let name: String?
    public let names: [Name]?
    public let pastDamageRelations: [TypeRelationsPast]?
    public let pokemon: [TypePokemon]?

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case gameIndices = "game_indices"
        case generation, id
        case moveDamageClass = "move_damage_class"
        case moves, name, names
        case pastDamageRelations = "past_damage_relations"
        case pokemon
    }

    public static var repository = WrappedRepository<Self>()
}

public struct TypePokemon: Codable {
    public let slot: Int?
    public let pokemon: NamedAPIResource
}

public struct TypeRelations: Codable {
    public let doubleDamageFrom: [NamedAPIResource]?
    public let doubleDamageTo, halfDamageFrom: [NamedAPIResource]?
    public let halfDamageTo, noDamageFrom, noDamageTo: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
}

public struct TypeRelationsPast: Codable {
    public let generation: NamedAPIResource
    public let damageRelations: TypeRelations

    enum CodingKeys: String, CodingKey {
        case generation
        case damageRelations = "damage_relations"
    }
}

