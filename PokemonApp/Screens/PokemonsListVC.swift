//
//  PAPokemonsListVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonsListVC: UIViewController {
    
    var pokemonType:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        title = pokemonType
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

}
