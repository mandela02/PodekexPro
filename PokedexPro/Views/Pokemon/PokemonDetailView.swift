//
//  PokemonDetailView.swift
//  PokedexPro
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import ViewExtensionForSwiftUI
import DatabasePlatform
import SwiftUI

struct PokemonDetailView: View {

    @Binding
    var pokemon: Pokemon?

    let animation: Namespace.ID

    @State
    private var size: CGSize = .zero

    @State
    private var isAppeared: Bool = false

    @State
    private var isHeaderHidden = false

    var body: some View {
        if let pokemon = pokemon {
            ZStack(alignment: .top) {
                ImageStickyHeaderView(
                    headerHeight: max(0, size.width - 50),
                    isHeaderHidden: $isHeaderHidden,
                    content: { Color.white.frame(height: 1000) },
                    header: { header }
                )
            }
            .background(
                Color.getColor(from: pokemon.mainType?.typeId ?? 0)
                    .matchedGeometryEffect(id: pokemon.order, in: animation)
                    .ignoresSafeArea()
            )
            .mask {
                RoundedRectangle(cornerRadius: 0)
                    .matchedGeometryEffect(id: pokemon.id, in: animation)
                    .ignoresSafeArea()
            }
            .readSize { size in
                self.size = size
            }
            .onAppear {
                withAnimation(.linear.delay(0.25)) {
                    isAppeared = true
                }
            }
            .onDisappear {
                withAnimation(.linear.delay(0.25)) {
                    isAppeared = false
                }
            }
            .transition(.scale(1).combined(with: .opacity))
        }
    }
}

extension PokemonDetailView {
    @ViewBuilder
    var navigationBar: some View {
        if isHeaderHidden {
            informationView
                .frame(maxWidth: .infinity)
                .padding(.all, 10)
                .background(
                    Color.getColor(from: pokemon?.mainType?.typeId ?? 0)
                )
                .transition(.opacity)

        }
    }

    var informationView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    name
                    types
                }

                Spacer()

                number
            }
            .padding(.all, 15)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 10)
    }

    var header: some View {
        ZStack(alignment: .center) {
            Image(uiImage: .icPokeball)
                .renderingMode(.template)
                .resizable()
                .matchedGeometryEffect(id: "\(pokemon?.id ?? "") pokeball", in: animation)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white.opacity(0.5))
                .padding(.all, 20)

            if let pokemon = pokemon {
                GeometryReader { geometry in
                    NetworkImage(
                        url: pokemon.avatar,
                        defaultImage: Image(uiImage: .icPokeball)
                    )
                    .matchedGeometryEffect(
                        id: pokemon.avatar,
                        in: animation,
                        anchor: .top
                    )
                    .padding(.all, 10)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center
                    )
                }
                .transition(.scale(scale: 1).combined(with: .opacity))
            }

            if !isHeaderHidden {
                informationView
                    .transition(.opacity)
            }
        }
    }

    @ViewBuilder
    var name: some View {
        if let pokemon = pokemon {
            AnimatableText(
                text: pokemon.name.capitalized.replacingOccurrences(of: "-", with: " "),
                size: isAppeared ? 32 : 25,
                weight: .bold,
                isAppeared: isAppeared
            )
            .matchedGeometryEffect(id: pokemon.name, in: animation)
            .foregroundColor(.white)
            .lineLimit(1)
        }
    }

    @ViewBuilder
    var number: some View {
        if let pokemon = pokemon {
            AnimatableText(
                text: "#\(pokemon.id)",
                size: isAppeared ? 32 : 30,
                weight: .bold,
                isAppeared: isAppeared
            )
            .matchedGeometryEffect(id: "#\(pokemon.id)", in: animation)
            .foregroundColor(.white)
            .lineLimit(1)
        }
    }

    @ViewBuilder
    var types: some View {
        if let pokemon = pokemon {
            HStack(alignment: .center, spacing: 8) {
                ForEach(pokemon.types.sorted(by: { $0.slot < $1.slot })) { type in
                    AnimatableText(
                        text: type.name.capitalized,
                        size: isAppeared ? 20 : 10,
                        weight: .semibold,
                        isAppeared: isAppeared
                    )
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
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
    }
}
