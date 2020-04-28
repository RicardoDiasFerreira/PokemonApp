//
//  Constant.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

enum Images {
    
    static let logoImage = UIImage(named: "pokemon-topo")
    static let pokemonEmpty = UIImage(named: "pokemon-empty")
}

enum CVSection {
    case main
}

enum SFSymbols {
    static let generation = UIImage(systemName: "wand.and.stars")
}

enum API {
    private static let pokemonApi = "https://pokeapi.co/api/v2/"
    
    static let pokemonType = "\(pokemonApi)type/"
    static let pokemonGens = "\(pokemonApi)generation/"
    static let pokemonInfo = "\(pokemonApi)pokemon/"
    
    static let pokemonImages = "https://pokeres.bastionbot.org/images/pokemon/"

}

enum PokemonTypeColor {
    
}
