//
//  PokedexProApp.swift
//  PokedexPro
//
//  Created by TriBQ on 19/09/2023.
//

import SwiftUI
import SwiftData
import Domain

@main
struct PokedexProApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(.production)
    }
}
