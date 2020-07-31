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
    @IBOutlet weak var pkmnName: UITextView!
    @IBOutlet weak var pkmnNumber: UITextView!
    @IBOutlet weak var pkmnTypes: UITextView!
    @IBOutlet weak var loadingIcon: UIActivityIndicatorView!
    @IBOutlet weak var addPkmn: UIButton!
    
    var delegate: PokemonDelegate? = nil
    
    
    var pokemonList = Array<Pokemon>()
    
    var currentPkmn: Pokemon?
    
    @IBAction func addPkmn(_ sender: Any) {
        if (currentPkmn != nil && self.delegate != nil) {
            self.delegate?.onPkmnReady(pkmn: currentPkmn!)
        }
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    
        
    }
    
    
    
    var searchText = ""
    
    func searchBar(_ searchBar: UISearchBar, textDidChange: String) {
        searchText = textDidChange
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        NetworkManager().getPokemon(pokemonName: searchText.lowercased()) { (pkmn) in
            
            self.currentPkmn = pkmn
            
            DispatchQueue.main.async {
                self.loadingIcon.startAnimating()
                let url:NSURL? = NSURL(string: pkmn.imageURL.front_default)
                let data:NSData? = NSData(contentsOf : url! as URL)
                let image = UIImage(data : data! as Data)
                self.imageView.image = image
                self.loadingIcon.stopAnimating()
                self.pkmnName.text = pkmn.name.capitalized
                self.pkmnNumber.text = String(pkmn.pokedexEntry)
                var types = Array<String>()
                pkmn.types.forEach { type in
                    types.append(type.type.name)
                }
                self.pkmnTypes.text = types.joined(separator: ", ")
                self.view.endEditing(true)
            }
            
        }
        
        
        
        
        
    }


}

