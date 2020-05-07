//
//  PersistenceManager.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 03/05/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    static func retrieveFavorites(completed: @escaping (Result <PokemonType, PAError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: "16") as? Data else {
            completed(.failure(.unableToFavorite))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode(PokemonType.self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func updateWith(pokemon: PokemonType) -> Bool {
        if isFavorited(id: pokemon.id!) {
            delete(id: pokemon.id!)
            return false
        } else {
            guard save(favorite: pokemon) != nil else {
                return true
            }
            return false
        }
    }
    
    static func isFavorited(id: String) -> Bool {
        return defaults.object(forKey: id) != nil
    }
    
    private static func delete(id: String) {
        defaults.removeObject(forKey: id)
    }
    
    private static func save(favorite: PokemonType) -> PAError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorite)
            defaults.set(encodedFavorites, forKey: favorite.id!)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
}
