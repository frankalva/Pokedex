//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Frank on 15/03/25.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    //Seteamos el color directamente para cada pokemon
    init(pokemon: Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.getBackground(forType: pokemon.type))
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Text("\(pokemon.name)")
                    .font(.subheadline).bold()
                    .foregroundStyle(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                
                HStack{
                    
                    Text("\(pokemon.type)")
                        .font(.subheadline).bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical,5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.35))
                            
                        }
                        .frame(width: 100, height: 25)
                    
                    KFImage(URL(string: "\(pokemon.imageUrl)")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                    
                }
                
            }
        }
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: backgroundColor, radius:6, x: 0.0 , y: 0.0)
    }
}

//#Preview {
 //   PokemonCell(pokemon: Pokemon)
//}
