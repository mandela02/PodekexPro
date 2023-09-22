//
//  EncounterConditionValues.swift
//  NetworkPlatform
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation

public struct EncounterConditionValue: Codable {
    public let id: Int?
    public let name: String?
    public let condition: NamedAPIResource
    public let names: [Name]
}
