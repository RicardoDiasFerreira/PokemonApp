//
//  TypeResults.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 02/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

struct TypesResults: Codable {
    let name:String
    let pokemon:[PokemonResults]
}
