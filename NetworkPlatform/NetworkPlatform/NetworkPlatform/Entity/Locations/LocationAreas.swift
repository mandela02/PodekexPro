//
//  LocationAreas.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct LocationArea: Codable {
    public let id: Int?
    public let name: String?
    public let gameIndex: Int?
    public let encounterMethodRates: [EncounterMethodRate]?
    public let location: NamedAPIResource?
    public let names: [Name]?
    public let pokemonEncounters: [PokemonEncounter]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case gameIndex = "game_index"
        case encounterMethodRates = "encounter_method_rates"
        case location
        case names
        case pokemonEncounters = "pokemon_encounters"
    }
}


public struct PokemonEncounter: Codable {
    public let pokemon: NamedAPIResource?
    public let versionDetails: VersionEncounterDetail?
    
    enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}

public struct EncounterMethodRate: Codable {
    public let encounterMethod: NamedAPIResource?
    public let versionDetails: [EncounterVersionDetails]?

    enum CodingKeys: String, CodingKey {
        case encounterMethod = "encounter_method"
        case versionDetails = "version_details"
    }
}

public struct EncounterVersionDetails: Codable {
    public let rate: Int?
    public let version: NamedAPIResource?
}

