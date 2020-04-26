//
//  GenerationCell.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 20/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class GenerationCell: CollectionViewCell {
    
    static let reuseID = "GenerationCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setCellConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String) {
        cellName.text = name.capitalizingFirstLetter()
        cellImage.image = UIImage(named: name)
    }
    
    func setCellConstraint() {
        let padding: CGFloat = 5
        NSLayoutConstraint.activate([
            cellName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cellName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cellName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            cellName.heightAnchor.constraint(equalToConstant: 20),
            
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cellImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

