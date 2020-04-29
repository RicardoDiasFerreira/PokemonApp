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
//    let locationImageView = UIImageView()
//    let locationLabel = GFSecondaryTitleLabel(fonSize: 18)
//    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(pokemonImageView, nameLabel, idLabel)
        view.backgroundColor = .systemBackground
        
        layoutUI()
        configureUIElements()
    }
    
    init(with pokemon: Pokemon) {
        super.init(nibName: nil, bundle: nil)
        self.pokemon = pokemon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        //constraints
    }
    
    private func configureUIElements() {
        //set labels values
        
    }
    
}
