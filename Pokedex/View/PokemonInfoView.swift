//
//  PokemonInfoView.swift
//  Pokedex
//
//  Created by Frank on 15/03/25.
//

import SwiftUI
import Kingfisher

struct PokemonInfoView: View {
    
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.getBackground(forType: pokemon.type))
    }
    
    var body: some View {
        
        //ZStack para colocar el fondo verde
        ZStack{
            backgroundColor.ignoresSafeArea()
            
            //Capa vertical para colocar la capa de VStack ignorando el safeArea
            VStack{
                //Mandas todo para abajo
                Spacer().frame(height: UIScreen.main.bounds.height * 0.2)

                
                KFImage(URL(string: "\(pokemon.imageUrl)")!)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .padding(.bottom, 20)
                    //Sobreponer la imagen encima de todo
                    .zIndex(1)
                
                
                VStack(spacing: 10){
                    VStack{
                        Text("\(pokemon.name)")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                        Text("\(pokemon.type)")
                            .font(.subheadline).bold()
                            .foregroundStyle(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical,5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(backgroundColor.opacity(0.35))
                                
                            }
                            .frame(width: 100, height: 25)
                        
                        Text("\(pokemon.description)")
                            
                        VStack{
                            HStack{
                                Text("Stats")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                        StatsRow(name: "Height", value: pokemon.height, color: .orange, maxValue: 2000)
                        StatsRow(name: "Attack", value: pokemon.attack, color: .red, maxValue: 2000)
                        StatsRow(name: "Defense", value: pokemon.defense, color: .blue, maxValue: 2000)
                        StatsRow(name: "Weight", value: pokemon.weight, color: .purple, maxValue: 2000)
                        StatsRow(name: "Total", value: 100, color: .green, maxValue: 200)
                        Spacer()
                    }
                                        
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height * 0.7)
                .padding(.bottom, 50)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                //Metodo para mover el background mas arriba
                .offset(y: -75)
                
            }
            .ignoresSafeArea(.all)
        }
        
        
    }
}

#Preview {
    PokemonInfoView(pokemon: MOCK_POKEMON[0], viewModel: PokemonViewModel())
}

//HStack con los datos personalizados
struct StatsRow: View {
    let name: String
    let value: Int
    let color: Color
    let maxValue: Int
    
    
    var body: some View{
        HStack{
            Text(name)
                .frame(width: 80, alignment: .leading)
                .foregroundStyle(.gray)
            Text("\(value)")
                .frame(width: 50, alignment: .leading)
            
            ProgressView(value: Double(value), total: Double(maxValue))
                .progressViewStyle(CustomProgressBar(color: color))
                .frame(width: 150)
        }
    }
    
    
}



//Custom progress Bar
struct CustomProgressBar: ProgressViewStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            ZStack(alignment: .leading){
                Rectangle().frame(width: 150, height: 20)
                    .foregroundStyle(Color.gray.opacity(0.35))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Rectangle().frame(width: 150 * CGFloat(configuration.fractionCompleted ?? 0.0), height: 20)
                    .foregroundStyle(color)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}
