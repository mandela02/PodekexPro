//
//  PokeType+Extension.swift
//  PokedexPro
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import SwiftUI

extension Color {
    static func getColor(from id: Int) -> Color {
        switch id {
        case 1:
            return .normal
        case 2:
            return .fighting
        case 3:
            return .fly
        case 4:
            return .poison
        case 5:
            return .ground
        case 6:
            return .rock
        case 7:
            return .bug
        case 8:
            return .ghost
        case 9:
            return .steel
        case 10:
            return .fire
        case 11:
            return .water
        case 12:
            return .grass
        case 13:
            return .electric
        case 14:
            return .psychic
        case 15:
            return .ice
        case 16:
            return .dragon
        case 17:
            return .dark
        case 18:
            return .fairy
        case 10001:
            return .unknow
        case 10002:
            return .unknow
        default:
            return .unknow
        }
    }
}
