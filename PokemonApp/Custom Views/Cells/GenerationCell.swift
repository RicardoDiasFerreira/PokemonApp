//
//  GenerationCell.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 20/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class GenerationCell: UICollectionViewCell {
    
    static let reuseID = "GenerationCell"
    let generationName = PATitleLabel(textAlignment: .left, fontSize: 20)
    let generationImage = PAAvatarImageView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String) {
        generationName.text = name.capitalizingFirstLetter()
        generationImage.image = UIImage(named: name)
    }
    
    func configure() {
        
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        addSubviews(generationName, generationImage)
        
        let padding: CGFloat = 5
        NSLayoutConstraint.activate([
            generationName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            generationName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            generationName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            generationName.heightAnchor.constraint(equalToConstant: 20),
            
            generationImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            generationImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            generationImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            generationImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
}
