//
//  GFError.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidURL  = "This URL createis not valid please try again!"
    case unableToComplete = "Unable to complete the request! Please check your internet connection"
    case invalidResponse  = "Invalid response from the server. Please try again!"
    case invalidData      = "The data received from the server was invalid. Please try again!"
    case unableToFavorite = "There was an error favoriting the user, please try again!"
    case alreadyInFavorites = "You already favorited this user, you must ❤️ them!"

}
