//
//  PokemonsViewModel.swift
//  PokedexPro
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import SwiftData
import DatabasePlatform
import Domain
import SwiftUtilities
import SwiftUI


@Observable
class PokemonsViewModel {
    var pokemons: [Pokemon] = []

    private var getPokemonUseCase = GetPokemonsUseCase()

    @ObservationIgnored
    private var offset = 0

    private var isLoading = false

    private func getNetworkPokemons(
        onComplete: @escaping OnValueChangeCallback<[Pokemon]>
    ) {
        Task { @MainActor in
            do {
                let pokemons = try await getPokemonUseCase.run(input: .init(offset: offset))
                onComplete(pokemons)
            } catch {
                print(error)
            }
        }
    }

    func refresh(
        context: ModelContext
    ) {
        self.pokemons = []
        self.offset = 0
        self.loadMoreIfNeed(context: context)
    }

    func loadMoreIfNeed(
        context: ModelContext
    ) {
        if isLoading {
            return
        }

        isLoading = true
        let nextBatchCount = Pokemon.count(context: context, offset: offset, limit: 20)
        if nextBatchCount == 0 {
            getNetworkPokemons { pokemons in
                for pokemon in pokemons {
                    if Pokemon.isExist(context: context, pokemon: pokemon) == false {
                        context.insert(pokemon)
                    }
                }
                self.offset += pokemons.count
                self.pokemons.append(contentsOf: pokemons)
                self.isLoading = false
            }
        } else {
            pokemons.append(contentsOf: Pokemon.fetch(context: context, offset: offset, limit: 20))
            offset += nextBatchCount
            self.isLoading = false
        }
    }
}

