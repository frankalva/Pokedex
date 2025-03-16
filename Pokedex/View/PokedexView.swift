//
//  PokedexView.swift
//  Pokedex
//
//  Created by Frank on 15/03/25.
//

import SwiftUI

struct PokedexView: View {
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(viewModel.pokemons, id:\.id) { pokemon in
                        NavigationLink(destination: PokemonInfoView(pokemon: pokemon, viewModel: viewModel)){
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                        }
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}
