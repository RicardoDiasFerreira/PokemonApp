//
//  String+Ext.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 02/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
