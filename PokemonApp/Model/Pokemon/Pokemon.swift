//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 28/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let weight: Int
    let stats:[StatModel]
}
