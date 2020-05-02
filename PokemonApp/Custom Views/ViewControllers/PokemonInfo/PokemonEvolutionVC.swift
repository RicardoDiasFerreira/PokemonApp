//
//  PokemonEvolutionVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 29/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonEvolutionVC: UIViewController {
    
    var pokemon:Pokemon!
    
    let pokemonImageView = PAAvatarImageView(frame: .zero)
    let evolvesToLabel = PATitleLabel(textAlignment: .center, fontSize: 18)
    let evolutionImageView = PAAvatarImageView(frame: .zero)
    
    init(with pokemon: Pokemon) {
        super.init(nibName: nil, bundle: nil)
        self.pokemon = pokemon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureLayoutUI()
        configureUIElements()
    }
    
    private func configureViewController() {
        //        view.backgroundColor = .systemBackground
        view.addSubviews(pokemonImageView, evolvesToLabel, evolutionImageView)
    }
    
    private func configureLayoutUI() {
        
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            pokemonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 90),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 90),
            
            evolvesToLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 10),
            evolvesToLabel.trailingAnchor.constraint(equalTo: evolutionImageView.leadingAnchor, constant: -10),
            evolvesToLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            evolvesToLabel.heightAnchor.constraint(equalToConstant: 25),
            
            evolutionImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            evolutionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            evolutionImageView.widthAnchor.constraint(equalToConstant: 90),
            evolutionImageView.heightAnchor.constraint(equalToConstant: 90),
            
        ])
        
    }
    
    private func configureUIElements() {
        
        pokemonImageView.downloadImage(pokemonID: String(pokemon.id))
        evolvesToLabel.text = "Evolves to ->"
        evolutionImageView.downloadImage(pokemonID: String(pokemon.id + 1))
    }
    
}
