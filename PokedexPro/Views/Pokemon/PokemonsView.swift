//
//  PokemonListView.swift
//  PokedexPro
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import SwiftUI
import DatabasePlatform
import ViewExtensionForSwiftUI

struct PokemonsView: View {
    @Environment(\.modelContext)
    private var modelContext

    @State
    private var viewModel = PokemonsViewModel()

    @State
    private var size: CGSize = .zero

    @State
    private var search: String = ""

    @Namespace
    private var animation

    @State
    private var selected: Pokemon?

    init() {
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .readSize { size in
                        self.size = size
                    }

                VStack {
                    ScrollView(
                        showsIndicators: false
                    ) {
                        LazyVGrid(
                            columns: [
                                GridItem(
                                    .flexible(
                                        minimum: 0,
                                        maximum: 500
                                    ),
                                    spacing: 5,
                                    alignment: .center
                                ),
                                GridItem(
                                    .flexible(
                                        minimum: 0,
                                        maximum: 500
                                    ),
                                    spacing: 5,
                                    alignment: .center
                                )
                            ],
                            alignment: .center,
                            spacing: 5,
                            content: {
                                ForEach(viewModel.pokemons) { model in
                                    if selected != nil {
                                        Color.clear
                                            .frame(height: (size.width - 15) / 2 * 0.7 )
                                    } else {
                                        PokemonCardView(
                                            pokemon: model,
                                            selected: $selected,
                                            animation: animation
                                        )
                                        .frame(height: (size.width - 15) / 2 * 0.7 )
                                        .onAppear {
                                            if viewModel.pokemons.suffix(5).contains(model) {
                                                viewModel.loadMoreIfNeed(context: modelContext)
                                            }
                                        }
                                    }
                                }
                            }
                        )
                        .padding(.all, 5)
                    }
                    .scrollTargetLayout(isEnabled: true)
                    .scrollTargetBehavior(.viewAligned)
                }
            }
            .onAppear {
                viewModel.loadMoreIfNeed(context: modelContext)
            }
            .navigationTitle("Pokedex")
            .searchable(text: $search, prompt: "Search")

        }
        .overlay {
            if selected != nil {
                PokemonDetailView(
                    pokemon: $selected,
                    animation: animation
                )
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.85, blendDuration: 0.25)) {
                        self.selected = nil
                    }
                }
            }
        }
    }
}
