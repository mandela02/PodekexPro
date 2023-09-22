//
//  LocationAreaEncounter.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import Foundation
import DataLayer
import Common

/// Pokemon Location Areas
///
/// Pokémon Location Areas are ares where Pokémon can be found.

public struct LocationAreaEncounter: Codable {
    public let locationArea: NamedAPIResource?
    public let versionDetails: [VersionEncounterDetail]?

    enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
        case versionDetails = "version_details"
    }

    public static var repository = WrappedRepository<Self>()
}
