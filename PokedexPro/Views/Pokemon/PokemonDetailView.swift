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
    var selected: Pokemon?
    var viewModel: PokemonsViewModel
    let animation: Namespace.ID

    @Environment(\.modelContext)
    private var modelContext

    @State
    private var size: CGSize = .zero

    @State
    private var isAppeared: Bool = false

    @State
    private var isDoneLoading: Bool = false

    @State
    private var isHeaderHidden = false

    @State
    private var percentHeaderHidden: CGFloat = .zero


    var body: some View {
        if let pokemon = selected {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    navigationBar

                    ImageStickyHeaderView(
                        headerHeight: max(0, size.width - 100),
                        isHeaderHidden: $isHeaderHidden,
                        percentHeaderHidden: $percentHeaderHidden,
                        content: { Color.white.frame(height: 1000) },
                        header: { header }
                    )
                }

            }
            .background(
                VStack(spacing: 0) {
                    Color.getColor(from: selected?.mainType?.typeId ?? 0)
                        .frame(height: 100)

                    Color
                        .white
                }
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.isDoneLoading = true
                })
            }
            .onDisappear {
                withAnimation(.linear.delay(0.25)) {
                    isAppeared = false
                }
            }
            .transition(.scale(1))
        }
    }
}

extension PokemonDetailView {
    @ViewBuilder
    var navigationBar: some View {
        informationView
            .frame(maxWidth: .infinity)
            .background(
                Color.getColor(from: selected?.mainType?.typeId ?? 0)
            )
    }

    var informationView: some View {
        HStack(spacing: 20) {
            Button(
                action: {
                    isDoneLoading = false
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.85, blendDuration: 0.25)) {
                        self.selected = nil
                    }
                },
                label: {
                    "chevron.left".systemImage
                        .foregroundStyle(.white)
                }
            )
            .frame(width: 20, height: 20)

            VStack(
                alignment: .leading, spacing: 10
            ) {
                name
                types
            }

            Spacer()

            number
        }
        .padding(.all, 15)
        .frame(maxWidth: .infinity)
    }

    var header: some View {
        ZStack(alignment: .center) {
            Image(uiImage: .icPokeball)
                .renderingMode(.template)
                .resizable()
                .matchedGeometryEffect(id: "\(selected?.id ?? "") pokeball", in: animation)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white.opacity(0.5))
                .padding(.all, 20)

            if isDoneLoading {
                GeometryReader { geometry in
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(viewModel.pokemons) { pokemon in
                                    NetworkImage(
                                        url: pokemon.avatar,
                                        defaultImage: Image(uiImage: .icPokeball)
                                    )
                                    .aspectRatio(contentMode: .fit)
                                    .frame(
                                        width: geometry.size.width,
                                        height: geometry.size.height,
                                        alignment: .center
                                    )
                                    .scrollTransition(.animated) { content, phase in
                                        content
                                            .scaleEffect(phase != .identity ? 0.6 : 1)
                                            .opacity(phase != .identity ? 0.3 : 1)
                                    }
                                    .id(pokemon)
                                    .onAppear {
                                        if viewModel.pokemons.suffix(20).contains(pokemon) {
                                            viewModel.loadMoreIfNeed(context: modelContext)
                                        }
                                    }

                                }
                            }
                        }
                        .onAppear(perform: {
                            withAnimation(.none) {
                                if let selected = selected {
                                    proxy.scrollTo(selected)
                                }
                            }
                        })
                        .scrollTargetLayout(isEnabled: true)
                        .scrollIndicators(.never)
                        .scrollClipDisabled(true)
                        .scrollPosition(id: $selected)
                        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .center
                        )
                    }
                }
            } else {
                if let pokemon = selected {
                    GeometryReader { geometry in
                        NetworkImage(
                            url: pokemon.avatar,
                            defaultImage: Image(uiImage: .icPokeball)
                        )
                        .matchedGeometryEffect(
                            id: pokemon.avatar,
                            in: animation
                        )
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .center
                        )
                    }
                }
            }
        }
        .background(
            Color.getColor(from: selected?.mainType?.typeId ?? 0)
                .matchedGeometryEffect(id: selected?.order, in: animation)
                .ignoresSafeArea()
        )
    }

    @ViewBuilder
    var name: some View {
        if let pokemon = selected {
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
        if let pokemon = selected {
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
        if let pokemon = selected {
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
