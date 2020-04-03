//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 02/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    static let reuseID = "PokemonCell"
    let pokemonAvatarImage = PAAvatarImageView(frame: .zero)
    let pokemonName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(pokemon: PokemonType) {
        pokemonAvatarImage.downloadImage(pokemonID: pokemon.url.getLastPathComponent())
        pokemonName.text = pokemon.name.capitalizingFirstLetter()
        backgroundColor = .systemGreen
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    private func configure() {
        addSubviews(pokemonAvatarImage, pokemonName)
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            pokemonAvatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            pokemonAvatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            pokemonAvatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            pokemonAvatarImage.heightAnchor.constraint(equalTo: pokemonAvatarImage.widthAnchor),
            
            pokemonName.topAnchor.constraint(equalTo: pokemonAvatarImage.bottomAnchor, constant: 12),
            pokemonName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            pokemonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            pokemonName.heightAnchor.constraint(equalToConstant: 20)

        ])
        
    }
}
