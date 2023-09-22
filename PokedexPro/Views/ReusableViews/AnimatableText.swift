//
//  AnimatableText.swift
//  PokedexPro
//
//  Created by TriBQ on 22/09/2023.
//

import Foundation
import SwiftUI

struct AnimatableText: View {
    let text: String
    let size: CGFloat
    let weight: Font.Weight

    let isAppeared: Bool

    var body: some View {
        Text(text)
            .animatableSystemFont(size: size, weight: weight)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct AnimatableSystemFontModifier: ViewModifier, Animatable {
    var size: Double
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension View {
    func animatableSystemFont(
        size: Double,
        weight: Font.Weight = .regular,
        design: Font.Design = .rounded
    ) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}
