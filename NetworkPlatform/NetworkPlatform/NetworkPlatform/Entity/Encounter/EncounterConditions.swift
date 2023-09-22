//
//  EncounterConditions.swift
//  NetworkPlatform
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation

public struct EncounterCondition: Codable {
    public let id: Int?
    public let name: String?
    public let names: [Name]
    public let values: [NamedAPIResource]
}

