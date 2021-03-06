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
    var types: [String] = ["Bug", "Dark", "Dragon", "Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel", "Water"]

    static var brokenLinks = ["Farfetch'd": "farfetchd", "Deoxys ( Attack Forme )": "deoxys-attack", "Deoxys ( Defense Forme )": "deoxys-defense", "Deoxys ( Speed Forme )": "deoxys-speed", "Deoxys ( Normal Forme )": "deoxys-normal"]
    
    init() {
        pokemon_array = PokemonGenerator.getPokemonArray()
    }
    
    func listTypes() -> [String] {
        return self.types
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

    // modified to support multiple type searching
    func searchTypes(types: [String]) -> [Pokemon?] {
        var ret_list: [Pokemon] = []
        for pokemon in pokemon_array {
            for type in pokemon.types {
                if types.contains(type) {
                    ret_list.append(pokemon)
                    break
                }
            }
        }
        return ret_list
    }

    // Is this inclusive, or not?
    // Right now, I have coded it as inclusive
    func searchMinATK(number: Int) -> [Pokemon?] {
        var ret_list: [Pokemon] = []
        for pokemon in pokemon_array {
            if pokemon.attack >= number {
                ret_list.append(pokemon);
            }
        }
        return ret_list
    }

    func searchMinDEF(number: Int) -> [Pokemon?] {
        var ret_list: [Pokemon] = []
        for pokemon in pokemon_array {
            if pokemon.defense >= number {
                ret_list.append(pokemon)
            }
        }
        return ret_list
    }

    func searchMinHP(number: Int) -> [Pokemon?] {
        var ret_list: [Pokemon] = []
        for pokemon in pokemon_array {
            if pokemon.health >= number {
                ret_list.append(pokemon)
            }
        }
        return ret_list
    }

    // pretty sure this will always be called with number=20
    // also, i'm sure there's a better way to gen k unique randoms 
    func randomPokemon(number: Int) -> [Pokemon?] {
        var randoms: [Int] = []
        var ret_list: [Pokemon] = []
        // Generating random indexes and appending to list 1/2 operations
        for _ in 0..<number {
            var rand = Int(arc4random_uniform(UInt32(pokemon_array.count)))
            while randoms.contains(rand) {
                rand = Int(arc4random_uniform(UInt32(pokemon_array.count)))
            }
            randoms.append(rand)
            ret_list.append(pokemon_array[rand])
        }
        return ret_list
    }
    
    func namesToPokemon(names: [String]) -> [Pokemon] {
        var pokemonList : [Pokemon] = []
        for name in names {
            pokemonList.append(searchName(name: name)!)
        }
        return pokemonList
    }
}
