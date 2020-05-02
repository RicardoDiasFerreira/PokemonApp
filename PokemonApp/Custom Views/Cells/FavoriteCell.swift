//
//  FavoriteCell.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 03/05/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let reuseID = "FavoriteCell"
    let pokemonImageView = PAAvatarImageView(frame: .zero)
    let pokemonNameLabel   = PATitleLabel(textAlignment: .left, fontSize: 26)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(pokemonImageView, pokemonNameLabel)
        
    }
    
    
}
