//
//  PDB.swift
//  Pokedex
//
//  Created by Stephen Jayakar on 9/19/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import Foundation

class PDB {
    var pokemon_array: [Pokemon]
    init() {
        pokemon_array = PokemonGenerator.getPokemonArray()
    }

    // Linear time
    func searchName(name: String) -> Pokemon? {
        for pokemon in pokemon_array {
            if pokemon.name == name {
                return pokemon
            }
        }
        return nil
    }

    // Linear time
    func searchNumber(number: Int) -> Pokemon? {
        for pokemon in pokemon_array {
            if pokemon.number == number {
                return pokemon
            }
        }
        return nil
    }
}
