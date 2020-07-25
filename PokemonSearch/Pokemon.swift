//
//  Pokemon.swift
//  PokemonSearch
//
//  Created by ParksPlus on 7/22/20.
//  Copyright © 2020 tberr. All rights reserved.
//

import Foundation


struct Pokemon: Codable {
    var name: String
    var types: [Types]
    var pokedexEntry: Int
    var imageURL: Sprites
    
    struct Types: Codable {
        var type: PokemonType
        
        struct PokemonType: Codable {
            var name: String
        }
    }
    
    struct Sprites: Codable {
        var front_default: String
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case types
        case pokedexEntry = "id"
        case imageURL = "sprites"
    }
}


