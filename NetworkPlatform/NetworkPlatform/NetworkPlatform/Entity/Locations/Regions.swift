//
//  Regions.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct Region: Codable {
    let id: Int?
    let locations: [NamedAPIResource]?
    let mainGeneration: NamedAPIResource?
    let name: String?
    let names: [Name]?
    let pokedexes, versionGroups: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case id, locations
        case mainGeneration = "main_generation"
        case name, names, pokedexes
        case versionGroups = "version_groups"
    }
}

