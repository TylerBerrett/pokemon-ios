//
//  Network.swift
//  PokemonSearch
//
//  Created by ParksPlus on 7/22/20.
//  Copyright © 2020 tberr. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private let base_url = "https://pokeapi.co/api/v2/pokemon/"
    
    func getPokemon(pokemonName: String, completionHandler: @escaping (Pokemon) -> Void) {
        let query = pokemonName.replacingOccurrences(of: " ", with: "").lowercased()
        let url = URL(string: base_url + query)!
        let session = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            let httpResponse = response as? HTTPURLResponse
            if (httpResponse?.statusCode == 200 && response?.mimeType == "application/json") {
                
                let pkmn = try! JSONDecoder().decode(Pokemon.self, from: data!)
                completionHandler(pkmn)
                
                
            } else {
                print("Error in type or status code")
            }
            if error != nil {
                print("Error")
            }
            
            
        })
        session.resume()
    }
    
}
