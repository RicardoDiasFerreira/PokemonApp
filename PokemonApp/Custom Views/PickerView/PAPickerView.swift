//
//  PAPickerView.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 05/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PAPickerView: UIPickerView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = 16
        layer.borderWidth = 1
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
