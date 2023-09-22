//
//  GetPokemonsUseCase.swift
//  Domain
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import NetworkPlatform
import DatabasePlatform
import SwiftData

public struct GetPokemonsUseCase: UseCaseProtocol {
    public typealias Output = [DatabasePlatform.Pokemon]

    public typealias Input = GetPokemonsUseCaseInput

    public init() {}

    public struct GetPokemonsUseCaseInput {
        let offset: Int

        public init(
            offset: Int
        ) {
            self.offset = offset
        }
    }

    public func run(input: GetPokemonsUseCaseInput) async throws -> [DatabasePlatform.Pokemon] {
        let list = try await NetworkPlatform
            .NamedAPIResourceList
            .repository
            .fetchItem(
                endpoint: .pokemon,
                param: [
                    "limit": 20,
                    "offset": input.offset
                ]
            )

        let pokemonResources = list.results ?? []
        var pokemons = try await withThrowingTaskGroup(
            of: DatabasePlatform.Pokemon.self,
            returning: [DatabasePlatform.Pokemon].self,
            body: { groups in
                var pokemons: [DatabasePlatform.Pokemon] = []
                for resource in pokemonResources {
                    groups.addTask {
                        try await self.getPokemon(from: resource.url ?? "")
                    }
                }

                for try await group in groups {
                    pokemons.append(group)
                }

                return pokemons
            }
        )

        pokemons = pokemons.sorted(by: { $0.id < $1.id })

        return pokemons
    }

    private func getPokemon(from url: String) async throws -> DatabasePlatform.Pokemon {
        let apiPokemon = try await NetworkPlatform
            .Pokemon
            .repository
            .fetchItem(path: url, param: [:])

        let typesResources = apiPokemon.types ?? []

        let types = try await withThrowingTaskGroup(
            of: DatabasePlatform.PokeType.self,
            returning: [DatabasePlatform.PokeType].self
        ) { groups in
            var databaseTypes: [DatabasePlatform.PokeType] = []

            for resource in typesResources {
                groups.addTask {
                    let type = try await NetworkPlatform
                        .PokeType
                        .repository
                        .fetchItem(path: resource.type?.url ?? "", param: [:])

                    let typeName = resource.type?.name ?? UUID().uuidString
                    let pokemonName = apiPokemon.name ?? UUID().uuidString
                    let slot = resource.slot ?? -1
                    return DatabasePlatform.PokeType(
                        id: "\(typeName) of \(pokemonName) at \(slot)",
                        slot: resource.slot ?? -1,
                        typeId: type.id ?? 0,
                        name: type.name ?? ""
                    )
                }
            }

            for try await group in groups {
                databaseTypes.append(group)
            }

            return databaseTypes
        }

        let pokemon = DatabasePlatform.Pokemon(from: apiPokemon)
        pokemon.types = types

        return pokemon
    }
}
