//
//  PABodyLabel.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 07/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PABodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    convenience init(textAligment: NSTextAlignment) {
        self.init(frame: .zero)
        textAlignment = textAligment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        adjustsFontForContentSizeCategory = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
