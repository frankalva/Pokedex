//
//  Pokemon.swift
//  Pokedex
//
//  Created by Frank on 15/03/25.
//

import Foundation


//Estructura de mi modelo
struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let imageUrl: String
    let name: String
    let type: String
    let weight: Int
    let height: Int
    let description: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, attack: 43, defense: 12, imageUrl: "1", name: "Bulbasor", type: "fire", weight: 12, height: 9, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
]

