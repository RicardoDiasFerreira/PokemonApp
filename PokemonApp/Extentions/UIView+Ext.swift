//
//  UIView+Ext.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 31/03/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views:UIView...) {
        views.forEach(addSubview)
        //        for view in views { addSubview(view) }
    }
    
    func setBackgroundColorByPokemonType(type: String) {
        
        switch type {
        case "normal":
            backgroundColor = .systemGray6
        case "fighting":
            backgroundColor = .brown
        case "flying":
            backgroundColor = .lightGray
        case "poison":
            backgroundColor = .systemPurple
        case "ground":
            backgroundColor = .orange
        case "fire":
            backgroundColor = UIColor.red.withAlphaComponent(0.65)
        case "water":
            backgroundColor = .systemBlue
        case "steel":
            backgroundColor = .systemGray
        case "electric":
            backgroundColor = .systemYellow
        case "bug":
            backgroundColor = UIColor.green.withAlphaComponent(0.5)
        case "grass":
            backgroundColor = UIColor.green.withAlphaComponent(0.5)
        default:
            backgroundColor = .white
        }
        
    }
}
