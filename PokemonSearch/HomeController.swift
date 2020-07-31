//
//  HomeController.swift
//  PokemonSearch
//
//  Created by ParksPlus on 7/31/20.
//  Copyright © 2020 tberr. All rights reserved.
//


import UIKit

class HomeController: UIViewController, PokemonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func onPkmnReady(pkmn: Pokemon) {
        print(pkmn.name)
        print(pkmn.imageURL)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: ViewController = segue.destination as! ViewController
        vc.delegate = self
    }
    
    
}

protocol PokemonDelegate {
    func onPkmnReady(pkmn: Pokemon)
}
