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
    let favorite = PAAvatarImageView(frame: .zero)
    
    var pokemon:PokemonType!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubviews(pokemonNumber, favorite)
        configureFavoriteImage()
        setCellConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(pokemon: PokemonType) {
        let pokemonID = pokemon.url.getLastPathComponent()
        self.pokemon = pokemon
        self.pokemon.id = pokemonID
        cellImage.downloadImage(pokemonID: pokemonID)
        cellName.text = pokemon.name.capitalizingFirstLetter()
        pokemonNumber.text = "#" + pokemonID
        favorite.image = PersistenceManager.isFavorited(id: pokemonID) ? SFSymbols.favorite : SFSymbols.noFavorite
    }
    
    private func configureFavoriteImage() {
        favorite.tintColor = .systemRed
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(updateFavoriteImage))
        favorite.isUserInteractionEnabled = true
        favorite.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setCellConstraint() {
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            cellName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cellName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cellName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            cellName.heightAnchor.constraint(equalToConstant: 20),
            
            pokemonNumber.centerYAnchor.constraint(equalTo: cellName.centerYAnchor),
            pokemonNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            pokemonNumber.leadingAnchor.constraint(equalTo: cellName.trailingAnchor, constant: -padding),
            pokemonNumber.heightAnchor.constraint(equalToConstant: 20),
            
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cellImage.widthAnchor.constraint(equalToConstant: 90),
            cellImage.heightAnchor.constraint(equalToConstant: 90),
            
            favorite.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            favorite.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            favorite.widthAnchor.constraint(equalToConstant: 25),
            favorite.heightAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    
    @objc func updateFavoriteImage() {
        favorite.image = PersistenceManager.updateWith(pokemon: pokemon) ? SFSymbols.favorite : SFSymbols.noFavorite
    }
}
