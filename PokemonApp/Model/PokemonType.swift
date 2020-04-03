//
//  Type.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 02/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

struct PokemonType: Codable, Hashable {
    let name: String
    let url: String
    let id: String?
}
