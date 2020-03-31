//
//  PATextField.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PATextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label // white in dark mode or black in normal mode -> .label color
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true // long input name makes the font smaller
        minimumFontSize = 12 // besides the adjustment, the minimum font size is 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no // avoid auto correct
        returnKeyType = .go
        clearButtonMode = .whileEditing // x to clear the whole input text
        placeholder = "Enter a pokemon type"
    }

}
