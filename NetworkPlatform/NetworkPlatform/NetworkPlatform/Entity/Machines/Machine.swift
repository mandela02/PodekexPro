//
//  Machine.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct Machine: Codable {
    public let id: Int?
    public let item: NamedAPIResource?
    public let move: NamedAPIResource?
    public let versionGroups: NamedAPIResource?
    
    enum CodingKeys: String, CodingKey {
        case id
        case item
        case move
        case versionGroups = "version_group"
    }
}
