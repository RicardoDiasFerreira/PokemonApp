//
//  PokemonMainInfoVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 29/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonMainInfoVC: UIViewController {
    
    var pokemon:Pokemon!
    
    let pokemonImageView = PAAvatarImageView(frame: .zero)
    let nameLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let idLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let weightLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let heightLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let expLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    
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
        view.addSubviews(pokemonImageView, nameLabel, idLabel, weightLabel, heightLabel, expLabel)
    }
    
    private func configureLayoutUI() {
        
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            pokemonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 110),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 110),
            
            nameLabel.topAnchor.constraint(equalTo: pokemonImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            idLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 10),
            idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            idLabel.heightAnchor.constraint(equalToConstant: 22),
            
            weightLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            weightLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 10),
            weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weightLabel.heightAnchor.constraint(equalToConstant: 22),
            
            heightLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor),
            heightLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 10),
            heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            heightLabel.heightAnchor.constraint(equalToConstant: 22),
            
            expLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor),
            expLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 10),
            expLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            expLabel.heightAnchor.constraint(equalToConstant: 22)
            
        ])
    }
    
    private func configureUIElements() {
        pokemonImageView.downloadImage(pokemonID: String(pokemon.id))
        nameLabel.text = "Name: " + pokemon.name.capitalizingFirstLetter()
        idLabel.text = "ID: #\(pokemon.id)"
        weightLabel.text = "Weight: \(pokemon.weight)"
        heightLabel.text = "Height: \(pokemon.height)"
        expLabel.text = "Exp: \(pokemon.baseExperience)"
        
    }
    
}
