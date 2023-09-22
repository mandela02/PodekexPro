//
//  ModelContainer+Extension.swift
//  Domain
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import SwiftData
import DatabasePlatform

extension ModelContainer {
    public static var production: ModelContainer = {
        let schema = Schema([
            Pokemon.self,
            PokeType.self,
            PokeSprite.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
