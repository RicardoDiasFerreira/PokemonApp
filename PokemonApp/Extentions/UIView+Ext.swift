//
//  UIView+Ext.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 31/03/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

extension UIView {
    
    //Variadic paramaters-> function that receives n parameters, and you can use it as an array
    func addSubviews(_ views:UIView...) {
        views.forEach(addSubview)
        //        for view in views { addSubview(view) }
    }
}
