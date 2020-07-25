//
//  ViewController.swift
//  PokemonSearch
//
//  Created by ParksPlus on 7/22/20.
//  Copyright © 2020 tberr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        
    }
    
    var searchText = ""
    
    func searchBar(_ searchBar: UISearchBar, textDidChange: String) {
        searchText = textDidChange
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        NetworkManager().getPokemon(pokemonName: searchText.lowercased()) { (pkmn) in
            
            DispatchQueue.main.async {
                let url:NSURL? = NSURL(string: pkmn.imageURL.front_default)
                let data:NSData? = NSData(contentsOf : url! as URL)
                let image = UIImage(data : data! as Data)
                self.imageView.image = image
                self.textView.text = pkmn.name
            }
            
        }
        
        
        
    }


}

