//
//  ViewController.swift
//  PokemonSearch
//
//  Created by ParksPlus on 7/22/20.
//  Copyright © 2020 tberr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager().getPokemon(pokemonName: "mewtwo")
    }


}

