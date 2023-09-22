//
//  MoveAilments.swift
//  NetworkPlatform
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation

public struct MoveAilment: Codable {
    public let id: Int?
    public let name: String?
    public let moves: [NamedAPIResource]?
    public let names: [Name]?
}

