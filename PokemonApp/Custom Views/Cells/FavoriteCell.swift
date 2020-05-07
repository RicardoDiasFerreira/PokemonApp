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
    let pokemonNameLabel = PATitleLabel(textAlignment: .left, fontSize: 26)
    let pokemonNumberLabel = PATitleLabel(textAlignment: .left, fontSize: 26)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(pokemon: PokemonType) {
        let pokemonID = pokemon.url.getLastPathComponent()
        pokemonImageView.downloadImage(pokemonID: pokemonID)
        pokemonNameLabel.text = pokemon.name.capitalizingFirstLetter()
    }
    
    private func configure() {
        addSubviews(pokemonImageView, pokemonNameLabel)
        
        accessoryType = .detailButton
        tintColor = .systemRed
        let padding:CGFloat = 10
        
        NSLayoutConstraint.activate([
            pokemonImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pokemonImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 60),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 60),
            
            pokemonNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 2 * padding),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            pokemonNameLabel.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])

    }
    
}
