//
//  Characteristics.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import Common
import DataLayer

/// Characteristics
///
/// Characteristics indicate which stat contains a Pokémon's highest IV. A Pokémon's Characteristic is determined by the remainder of its highest IV divided by 5 (gene_modulo). Check out Bulbapedia for greater detail.
public struct Characteristic: Codable {
    public let descriptions: [Description]?
    public let geneModulo: Int?
    public let highestStat: NamedAPIResource?
    public let id: Int?
    public let possibleValues: [Int]?

    enum CodingKeys: String, CodingKey {
        case descriptions
        case geneModulo = "gene_modulo"
        case highestStat = "highest_stat"
        case id
        case possibleValues = "possible_values"
    }

    public static var repository = WrappedRepository<Self>()
}
