//
//  PAAlertContainerView.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 07/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PAAlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.borderWidth = 2
        layer.cornerRadius = 15
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
