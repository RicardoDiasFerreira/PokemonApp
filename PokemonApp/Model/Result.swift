//
//  Result.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 02/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

struct ResultModel: Codable {
    let count:Int
    let results:[PokemonType]
}
