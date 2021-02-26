//
//  PokemonListView.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.pokemon) { pokemon in
                Text(pokemon.name.capitalized)
            }
            .navigationTitle("Pokemon")
        }.onAppear {
            self.viewModel.getPokemonList()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
