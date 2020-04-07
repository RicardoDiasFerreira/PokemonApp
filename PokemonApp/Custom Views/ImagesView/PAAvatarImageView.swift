//
//  PAAvatarImageView.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 02/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PAAvatarImageView: UIImageView {
    
    let placeHolderImage = Images.pokemonEmpty
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        // the imageview image is confined to the bounds of the imageview (the avatar image also has the cornerRadius)
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(pokemonID: String) {
        NetworkManager.shared.downloadImage(pokemonID: pokemonID) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
}

