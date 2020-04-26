//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 02/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonCell: CollectionViewCell {
    static let reuseID = "PokemonCell"
    let pokemonNumber = PATitleLabel(textAlignment: .right, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setCellConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(pokemon: PokemonType) {
        let pokemonID = pokemon.url.getLastPathComponent()
        
        cellImage.downloadImage(pokemonID: pokemonID)
        cellName.text = pokemon.name.capitalizingFirstLetter()
        pokemonNumber.text = "#" + pokemonID
    }
    
    func setCellConstraint() {
        addSubviews(pokemonNumber)
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            cellName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cellName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cellName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            cellName.heightAnchor.constraint(equalToConstant: 20),
            
            pokemonNumber.centerYAnchor.constraint(equalTo: cellName.centerYAnchor),
            pokemonNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            pokemonNumber.leadingAnchor.constraint(equalTo: cellName.trailingAnchor, constant: -padding),
            pokemonNumber.heightAnchor.constraint(equalToConstant: 20),
            
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cellImage.widthAnchor.constraint(equalToConstant: 90),
            cellImage.heightAnchor.constraint(equalToConstant: 90)
            
        ])
    }
}
