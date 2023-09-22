//
//  Pokemon.swift
//  DatabasePlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import SwiftData

@Model
public class Pokemon {
    @Attribute(.unique)
    public var id: String

    public var name: String
    public var order: Int

    public var images: PokeSprite?
    public var types: [PokeType] = []

    @Transient()
    public lazy var avatar = images?.frontDefault ?? ""

    @Transient
    public var mainType: PokeType? {
        types.min(by: { $0.slot < $1.slot })
    }


    public init(
        id: String,
        name: String,
        order: Int
    ) {
        self.id = id
        self.order = order
        self.name = name
    }
}

extension Pokemon {
    static public func countAll(context: ModelContext) -> Int {
        (try? context.fetchCount(FetchDescriptor<Self>())) ?? 0
    }

    static public func count(context: ModelContext, offset: Int, limit: Int) -> Int {
        var fetchDescriptor = FetchDescriptor<Pokemon>()
        fetchDescriptor.fetchLimit = 20
        fetchDescriptor.fetchOffset = offset
        let nextBatchCount = try? context.fetchCount(
            fetchDescriptor
        )
        return nextBatchCount ?? 0
    }

    static public func isExist(context: ModelContext, pokemon: Pokemon) -> Bool {
        let id = pokemon.id

        let predicate = #Predicate<Pokemon> {
            $0.id == id
        }

        let fetchDescriptor = FetchDescriptor<Pokemon>(
            predicate: predicate
        )

        let result = (try? context.fetch(fetchDescriptor)) ?? []
        return !result.isEmpty
    }

    static public func fetch(context: ModelContext, offset: Int, limit: Int) -> [Pokemon] {
        var fetchDescriptor = FetchDescriptor<Pokemon>(
            sortBy: [
                .init(\.order, order: .forward)
            ]
        )
        fetchDescriptor.fetchLimit = 20
        fetchDescriptor.fetchOffset = offset
        let nextBatch = try? context.fetch(fetchDescriptor)
        return nextBatch ?? []
    }
}

@Model
public class PokeType {
    @Attribute(.unique)
    public var id: String

    public var slot: Int
    public var typeId: Int
    public var name: String

    @Relationship(deleteRule: .cascade, inverse: \Pokemon.types)
    public var pokemons: Pokemon?

    public init(
        id: String,
        slot: Int,
        typeId: Int,
        name: String
    ) {
        self.id = id
        self.name = name
        self.typeId = typeId
        self.slot = slot
    }
}

@Model
public class PokeSprite {
    @Attribute(.unique)
    public var id: String

    public let backDefault: String
    public let backFemale: String
    public let backShiny: String
    public let backShinyFemale: String
    public let frontDefault: String
    public let frontFemale: String
    public let frontShiny: String
    public let frontShinyFemale: String

    @Relationship(deleteRule: .cascade, inverse: \Pokemon.images)
    public var pokemon: Pokemon?

    public init(
        id: String,
        backDefault: String,
        backFemale: String,
        backShiny: String,
        backShinyFemale: String,
        frontDefault: String,
        frontFemale: String,
        frontShiny: String,
        frontShinyFemale: String
    ) {
        self.id = id
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
    }
}
