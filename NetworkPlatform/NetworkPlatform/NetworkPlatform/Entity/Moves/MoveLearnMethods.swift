//
//  MoveLearnMethods.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct MoveLearnMethod: Codable {
    public let id: Int?
    public let name: String?
    public let descriptions: [Description]?
    public let names: [Name]?
    public let versionGroups: [NamedAPIResource]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case descriptions
        case names
        case versionGroups = "version_groups"
    }
}
