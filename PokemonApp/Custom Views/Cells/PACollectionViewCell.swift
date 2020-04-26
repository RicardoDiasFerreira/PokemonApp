//
//  PACollectionViewCell.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 22/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

typealias CollectionViewCell = PACollectionViewCell & PACollectionViewCellDelegate

protocol PACollectionViewCellDelegate {
    func setCellConstraint()
}

class PACollectionViewCell: UICollectionViewCell {
        
    let cellName = PATitleLabel(textAlignment: .left, fontSize: 16)
    let cellImage = PAAvatarImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
           
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        addSubviews(cellName, cellImage)
    }
}
