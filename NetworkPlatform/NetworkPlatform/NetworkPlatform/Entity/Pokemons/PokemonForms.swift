//
//  PokemonForms.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Pokemon Forms
///
///Some Pokémon may appear in one of multiple, visually different forms. These differences are purely cosmetic. For variations within a Pokémon species, which do differ in more than just visuals, the 'Pokémon' entity is used to represent such a variety.

public struct PokemonForm: Codable {
    public let id: Int?
    public let formName: String?
    public let formNames: [Name]?
    public let formOrder: Int
    public let isBattleOnly, isDefault, isMega: Bool?
    public let name: String?
    public let names: [Name]?
    public let order: Int?
    public let pokemon: NamedAPIResource?
    public let sprites: PokemonFormSprites?
    public let types: [PokemonFormType]?
    public let versionGroup: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case formName = "form_name"
        case formNames = "form_names"
        case formOrder = "form_order"
        case id
        case isBattleOnly = "is_battle_only"
        case isDefault = "is_default"
        case isMega = "is_mega"
        case name, names, order, pokemon, sprites, types
        case versionGroup = "version_group"
    }

    public static var repository = WrappedRepository<Self>()
}

public struct PokemonFormSprites: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
