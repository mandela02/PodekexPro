//
//  Locations.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct Location: Codable {
    let areas: [NamedAPIResource]?
    let gameIndices: [GenerationGameIndex]?
    let id: Int?
    let name: String?
    let names: [Name]?
    let region: NamedAPIResource?

    enum CodingKeys: String, CodingKey {
        case areas
        case gameIndices = "game_indices"
        case id, name, names, region
    }
}

