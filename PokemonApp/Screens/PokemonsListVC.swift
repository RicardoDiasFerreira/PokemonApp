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
    var pokemons:[PokemonResults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        title = pokemonType.capitalizingFirstLetter()
        
        getPokemonsWithType()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    init(pokemonType: String) {
        super.init(nibName: nil, bundle: nil)
        self.pokemonType = pokemonType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getPokemonsWithType() {
        NetworkManager.shared.getPokemonByType(type: pokemonType, completed: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
            case.failure(let error):
                print("error-> \(error.rawValue)")
            }
            
        })
    }
    
    private func downloadPokemonImages() {
        
        
    }
        
}
