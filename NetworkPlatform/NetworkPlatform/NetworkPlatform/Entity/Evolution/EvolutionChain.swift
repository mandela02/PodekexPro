//
//  EvolutionChain.swift
//  NetworkPlatform
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import DataLayer

/// Evolution chains are essentially family trees. They start with the lowest stage within a family and detail evolution conditions for each as well as Pokémon they can evolve into up through the hierarchy.
public struct EvolutionChain: Codable {
    /// The item that a Pokémon would be holding when mating that would trigger the egg hatching a baby Pokémon rather than a basic Pokémon.
    ///
    /// to `Item`
    public let babyTriggerItem: NamedAPIResource?

    /// The base chain link object. Each link contains evolution details for a Pokémon in the chain. Each link references the next Pokémon in the natural evolution order.
    public let chain: ChainLink?
    public let id: Int?

    enum CodingKeys: String, CodingKey {
        case babyTriggerItem = "baby_trigger_item"
        case chain, id
    }

    static let repository = WrappedRepository<Self>()
}

public struct ChainLink: Codable {

    let evolutionDetails: [EvolutionDetail]?
    let evolvesTo: [ChainLink]?

    /// Whether or not this link is for a baby Pokémon. This would only ever be true on the base link.
    let isBaby: Bool?

    /// The Pokémon species at this point in the evolution chain.
    ///
    /// to `PokemonSpecies`
    let species: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}

struct EvolutionDetail: Codable {
    /// The id of the gender of the evolving Pokémon species must be in order to evolve into this Pokémon species.
    let gender: Int?

    /// The item required to cause evolution this into Pokémon species.
    ///
    /// to `Item`
    let item: NamedAPIResource?

    ///The item the evolving Pokémon species must be holding during the evolution trigger event to evolve into this Pokémon species.
    ///
    /// to `Item`
    let heldItem: NamedAPIResource?

    /// The move that must be known by the evolving Pokémon species during the evolution trigger event in order to evolve into this Pokémon species.
    ///
    /// to `Move`
    let knownMove: NamedAPIResource?

    let minAffection: Int?
    let minBeauty: Int?
    let minHappiness: Int?
    let minLevel: Int?

    let location: NamedAPIResource?
    let knownMoveType: NamedAPIResource?
    let needsOverworldRain: Bool?
    let partySpecies: NamedAPIResource?
    let partyType: NamedAPIResource?
    let relativePhysicalStats: Int
    let timeOfDay: String?
    let tradeSpecies: NamedAPIResource?
    let trigger: NamedAPIResource?
    let turnUpsideDown: Bool?

    enum CodingKeys: String, CodingKey {
        case gender
        case heldItem = "held_item"
        case item
        case knownMove = "known_move"
        case knownMoveType = "known_move_type"
        case location
        case minAffection = "min_affection"
        case minBeauty = "min_beauty"
        case minHappiness = "min_happiness"
        case minLevel = "min_level"
        case needsOverworldRain = "needs_overworld_rain"
        case partySpecies = "party_species"
        case partyType = "party_type"
        case relativePhysicalStats = "relative_physical_stats"
        case timeOfDay = "time_of_day"
        case tradeSpecies = "trade_species"
        case trigger
        case turnUpsideDown = "turn_upside_down"
    }
}
