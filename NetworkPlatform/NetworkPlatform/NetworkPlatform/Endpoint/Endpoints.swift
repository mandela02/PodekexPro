//
//  Endpoints.swift
//  NetworkPlatform
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation

public enum Endpoints: String {
    case pokemon = "https://pokeapi.co/api/v2/pokemon/"
    case type = "https://pokeapi.co/api/v2/type/"

    public var value: String {
        self.rawValue
    }
}
