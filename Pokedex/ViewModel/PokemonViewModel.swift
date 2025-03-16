//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Frank on 15/03/25.
//

import Foundation
import UIKit

//Extiende de un observable
class PokemonViewModel: ObservableObject{
    
    @Published var pokemons: [Pokemon] = []
    
    init(){
        fetchPokemons()
    }
    
    //Metodo para obtener el color en base al tipo
    func getBackground(forType type: String) -> UIColor {
        switch type{
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemTeal
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemBlue
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
    }
    
    func fetchPokemons(){
        
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else {fatalError("Missing Url") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error{
                print("Request error:", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        guard let data = data.parseData(removeString: "null,") else {return}
                        let pokemonsJson = try JSONDecoder().decode([Pokemon].self, from: data)
                        self.pokemons = pokemonsJson
                        
                    } catch let error {
                        print("Error decoding:", error)
                    }
                }
                
            }
            
        }
        dataTask.resume()
    }
}



//Extension para parsear y eliminar el null
extension Data{
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data
    }
}
