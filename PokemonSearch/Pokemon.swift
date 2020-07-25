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
    
    struct Types: Codable {
        var name: String
    }
}


