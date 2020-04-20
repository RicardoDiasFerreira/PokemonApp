//
//  GenResult.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 20/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

struct GenResult: Codable {
    let count: Int
    let results: [GenModel]
}
