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
    let pokemonName = UILabel()
    let pokemonNumber = UILabel()
    let pokemonAvatarImage = PAAvatarImageView(frame: .zero)
   
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(pokemon: PokemonType) {
        let pokemonID = pokemon.url.getLastPathComponent()
        
        pokemonAvatarImage.downloadImage(pokemonID: pokemonID)
        pokemonName.text = pokemon.name.capitalizingFirstLetter()
        pokemonNumber.text = "#" + pokemonID
        backgroundColor = .systemGreen
    }
    
    private func configure() {
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        addSubviews(pokemonAvatarImage, pokemonName, pokemonNumber)
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        pokemonNumber.translatesAutoresizingMaskIntoConstraints = false
        pokemonNumber.textAlignment = .right
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            pokemonName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            pokemonName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            pokemonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            pokemonName.heightAnchor.constraint(equalToConstant: 20),
            
            pokemonNumber.centerYAnchor.constraint(equalTo: pokemonName.centerYAnchor),
            pokemonNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            pokemonNumber.leadingAnchor.constraint(equalTo: pokemonName.trailingAnchor, constant: -padding),
            pokemonNumber.heightAnchor.constraint(equalToConstant: 20),

            
            pokemonAvatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            pokemonAvatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            pokemonAvatarImage.widthAnchor.constraint(equalToConstant: 90),
            pokemonAvatarImage.heightAnchor.constraint(equalToConstant: 90)

        ])
        
    }
}
