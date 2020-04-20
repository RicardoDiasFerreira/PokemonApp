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
    
    func createTwoColumnFlowLayout() -> UICollectionViewLayout {
        let width                       = self.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 2
        
        //UICollectionViewFlowLayout concrete layout object that organizes items into a grid with optional header and footer views for each section.
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets.init(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize.init(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}
