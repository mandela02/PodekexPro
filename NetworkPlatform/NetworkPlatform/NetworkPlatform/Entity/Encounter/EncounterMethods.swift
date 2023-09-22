//
//  EncounterMethod.swift
//  NetworkPlatform
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation

public struct EncounterMethod: Codable {
    public let id: Int?
    public let name: String?
    public let order: Int
    public let names: [Name]
}

