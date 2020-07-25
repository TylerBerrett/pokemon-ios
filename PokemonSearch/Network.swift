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
    
    func getPokemon(pokemonName: String) {
        let url = URL(string: base_url + pokemonName)!
        let session = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            let httpResponse = response as? HTTPURLResponse
            if (httpResponse?.statusCode == 200 && response?.mimeType == "application/json") {
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                
                let jsonData = (json as? String ?? "").data(using: .utf8)!
                
                let pkmn = try! JSONDecoder().decode(Pokemon.self, from: json as! Data)
                
                print(pkmn)
                
                
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
