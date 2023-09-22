//
//  Pokemon.swift
//  Domain
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import NetworkPlatform
import DatabasePlatform
import SwiftUtilities

public extension DatabasePlatform.Pokemon {
    convenience init(from pokemon: NetworkPlatform.Pokemon) {
        let id = pokemon.id?.asString ?? UUID().uuidString

        self.init(
            id: id,
            name: pokemon.name ?? "",
            order: pokemon.order ?? 0
        )

        let sprites = DatabasePlatform.PokeSprite(
            id: id,
            backDefault: pokemon.sprites?.backDefault ?? "",
            backFemale: pokemon.sprites?.backFemale ?? "",
            backShiny: pokemon.sprites?.backShiny ?? "",
            backShinyFemale: pokemon.sprites?.backShinyFemale ?? "",
            frontDefault: pokemon.sprites?.frontDefault ?? "",
            frontFemale: pokemon.sprites?.frontFemale ?? "",
            frontShiny: pokemon.sprites?.frontShiny ?? "",
            frontShinyFemale: pokemon.sprites?.frontShinyFemale ?? ""
        )

        self.images = sprites
    }
}
