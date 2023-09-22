//
//  PokemonSpecies.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Pokemon Specie
///
/// A Pokémon Species forms the basis for at least one Pokémon. Attributes of a Pokémon species are shared across all varieties of Pokémon within the species. A good example is Wormadam; Wormadam is the species which can be found in three different varieties, Wormadam-Trash, Wormadam-Sandy and Wormadam-Plant.
public struct PokemonSpecie: Codable {
    let baseHappiness, captureRate: Int?
    let color: NamedAPIResource?
    let eggGroups: [NamedAPIResource]?
    let evolutionChain: APIResource?
    let evolvesFromSpecies: NamedAPIResource?
    let flavorTextEntries: [FlavorText]?
    let formDescriptions: [Description]?
    let formsSwitchable: Bool?
    let genderRate: Int?
    let genera: [Genus]?
    let generation, growthRate, habitat: NamedAPIResource?
    let hasGenderDifferences: Bool?
    let hatchCounter, id: Int?
    let isBaby, isLegendary, isMythical: Bool?
    let name: String?
    let names: [Name]?
    let order: Int?
    let palParkEncounters: [PalParkEncounterArea]?
    let pokedexNumbers: [PokemonSpeciesDexEntry]?
    let shape: NamedAPIResource?
    let varieties: [PokemonSpeciesVariety]?

    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera, generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name, names, order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape, varieties
    }

    public static var repository = WrappedRepository<Self>()
}

public struct PokemonSpeciesVariety: Codable {
    public let isDefault: Bool?
    public let pokemon: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
}

public struct PalParkEncounterArea: Codable {
    public let area: NamedAPIResource?
    public let baseScore, rate: Int?

    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
}

public struct PokemonSpeciesDexEntry: Codable {
    public let entryNumber: Int?
    public let pokedex: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

public struct Genus: Codable {
    let genus: String?
    let language: NamedAPIResource?
}

