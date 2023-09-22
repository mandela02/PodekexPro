//
//  PokemonCardView.swift
//  PokedexPro
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import DatabasePlatform
import SwiftUI
import ViewExtensionForSwiftUI

struct PokemonCardView: View {
    var pokemon: Pokemon

    @Binding
    var selected: Pokemon?

    let animation: Namespace.ID

    @State
    private var isAppeared: Bool = true

    var body: some View {
        ZStack(
            alignment: Alignment(
                horizontal: .leading,
                vertical: .top
            )
        ) {
            pokeball
            
            VStack(alignment: .leading, spacing: 10) {
                name
                types
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
            
            image

            number
        }
        .background(
            Color.getColor(from: pokemon.mainType?.typeId ?? 0)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .matchedGeometryEffect(id: pokemon.order, in: animation)
        )
        .mask {
            RoundedRectangle(cornerRadius: 20)
                .matchedGeometryEffect(id: pokemon.id, in: animation)
        }
        .onAppear {
            withAnimation(.linear) {
                isAppeared = true
            }
        }
        .onDisappear {
            withAnimation(.linear) {
                isAppeared = selected != pokemon
            }
        }
        .onTapGesture {
            withAnimation(
                .interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.85,
                    blendDuration: 0.25
                )
            ) {
                selected = pokemon
            }
        }
        .id(pokemon.id)
        .transition(.scale(1).combined(with: .opacity))
    }
}

extension PokemonCardView {
    var pokeball: some View {
        GeometryReader { geometry in
            HStack() {
                Spacer()
                Image(uiImage: .icPokeball)
                    .renderingMode(.template)
                    .resizable()
                    .matchedGeometryEffect(id: "\(pokemon.id) pokeball", in: animation)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.white.opacity(0.5))
                    .offset(x: 20, y: 20)
            }
        }
    }

    var name: some View {
        AnimatableText(
            text: pokemon.name.capitalized.replacingOccurrences(of: "-", with: " "),
            size: isAppeared ? 25 : 32,
            weight: .bold,
            isAppeared: isAppeared
        )
        .matchedGeometryEffect(id: pokemon.name, in: animation)
        .foregroundColor(.white)
        .lineLimit(1)
    }

    var types: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(pokemon.types.sorted(by: { $0.slot < $1.slot })) { type in
                AnimatableText(
                    text: type.name.capitalized,
                    size: isAppeared ? 10 : 20,
                    weight: .semibold,
                    isAppeared: isAppeared
                )
                .lineLimit(1)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    Color.getColor(from: type.typeId)
                        .opacity(0.8)
                        .background(
                            .thickMaterial
                        )
                )
                .clipShape(Capsule())
                .matchedGeometryEffect(id: type.id, in: animation)
            }
        }
    }

    var image: some View {
        GeometryReader { geometry in
            HStack() {
                Spacer()
                NetworkImage(url: pokemon.avatar, defaultImage: Image(uiImage: .icPokeball))
                    .matchedGeometryEffect(
                        id: pokemon.avatar,
                        in: animation
                    )
                    .transition(.scale(scale: 1).combined(with: .opacity))
                    .frame(
                        width: geometry.size.height,
                        height: geometry.size.height
                    )
                    .scaleEffect(1.4)
                    .offset(x: 15, y: 15)
            }
        }
    }

    var number: some View {
        AnimatableText(
            text: "#\(pokemon.id)",
            size: isAppeared ? 30 : 32,
            weight: .bold,
            isAppeared: isAppeared
        )
        .matchedGeometryEffect(id: "#\(pokemon.id)", in: animation)
        .foregroundColor(Color.white.opacity(0.8))
        .lineLimit(1)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}
