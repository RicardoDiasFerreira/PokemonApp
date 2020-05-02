//
//  PokemonStatsVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 29/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonStatsVC: UIViewController {
    
    var pokemon:Pokemon!
    
    let attackLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let defenseLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let specialAttackLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let specialDefenseLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let speedLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    let hpLabel = PATitleLabel(textAlignment: .left, fontSize: 18)
    
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
        view.addSubviews(attackLabel, defenseLabel, specialAttackLabel, specialDefenseLabel, speedLabel, hpLabel)
    }
    
    private func configureLayoutUI() {
        
        NSLayoutConstraint.activate([
            attackLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            attackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            attackLabel.heightAnchor.constraint(equalToConstant: 25),
            attackLabel.widthAnchor.constraint(equalToConstant: (view.bounds.width/2) - 25),
            
            defenseLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            defenseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            defenseLabel.heightAnchor.constraint(equalToConstant: 25),
            defenseLabel.widthAnchor.constraint(equalToConstant: (view.bounds.width/2) - 25),
            
            specialAttackLabel.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 10),
            specialAttackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            specialAttackLabel.heightAnchor.constraint(equalToConstant: 25),
            specialAttackLabel.widthAnchor.constraint(equalToConstant: (view.bounds.width/2) - 25),
            
            specialDefenseLabel.topAnchor.constraint(equalTo: defenseLabel.bottomAnchor, constant: 10),
            specialDefenseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            specialDefenseLabel.heightAnchor.constraint(equalToConstant: 25),
            specialDefenseLabel.widthAnchor.constraint(equalToConstant: (view.bounds.width/2) - 25),
            
            speedLabel.topAnchor.constraint(equalTo: specialAttackLabel.bottomAnchor, constant: 10),
            speedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            speedLabel.heightAnchor.constraint(equalToConstant: 25),
            speedLabel.widthAnchor.constraint(equalToConstant: (view.bounds.width/2) - 25),
            
            hpLabel.topAnchor.constraint(equalTo: specialDefenseLabel.bottomAnchor, constant: 10),
            hpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            hpLabel.heightAnchor.constraint(equalToConstant: 25),
            hpLabel.widthAnchor.constraint(equalToConstant: (view.bounds.width/2) - 25)
        ])
        
    }
    
    private func configureUIElements() {
        attackLabel.text = "Attack: \(pokemon.stats[4].baseStat)"
        defenseLabel.text = "Defense: \(pokemon.stats[3].baseStat)"
        specialAttackLabel.text = "Sp. Attack: \(pokemon.stats[2].baseStat)"
        specialDefenseLabel.text = "Sp. Defense: \(pokemon.stats[1].baseStat)"
        speedLabel.text = "Speed: \(pokemon.stats[0].baseStat)"
        hpLabel.text = "HP: \(pokemon.stats[5].baseStat)/\(pokemon.stats[5].baseStat)"
    }
}
