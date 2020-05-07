//
//  PersistenceManager.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 03/05/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    //    let str = String(decoding: data, as: UTF8.self)
    
    static func updateWith(favorite: PokemonType, completed: @escaping (PAError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                guard !favorites.contains(favorite) else {
                    favorites.removeAll { $0.id == favorite.id }
                    //TODO: remove one of them
                    completed(save(favorite: favorites))
                    completed(.alreadyInFavorites)
                    return
                }
                
                favorites.append(favorite)
                completed(save(favorite: favorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result <[PokemonType], PAError>) -> Void) {
        
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([PokemonType].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }

    private static func delete(id: String) {
        defaults.removeObject(forKey: id)
    }
    
    private static func save(favorite: [PokemonType]) -> PAError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorite)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
}
