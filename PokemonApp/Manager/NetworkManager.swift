//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()

    func getPokemonTypes(completed: @escaping(Result<[PokemonType], GFError>) -> Void) {
        
        let endPoint = ApiURLs.pokemonApi + "type"
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)  in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ResultModel.self, from: data)
                completed(.success(result.results))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getPokemonByType(type: String, completed: @escaping(Result<[PokemonResults], GFError>) -> Void) {
        
        let endPoint = ApiURLs.pokemonApi + "type/\(type)"
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)  in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let type = try JSONDecoder().decode(TypesResults.self, from: data)
                completed(.success(type.pokemon))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(pokemonID: String, completed: @escaping(UIImage?) -> Void) {
        let endPoint = ApiURLs.pokemonImages + "\(pokemonID).png"
        
        if let cachedImage = cache.object(forKey: pokemonID as NSString) {
            completed(cachedImage)
            return
        }
                
        guard let url = URL(string: endPoint) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                        
            self.cache.setObject(image, forKey: pokemonID as NSString)
            completed(image)
        }
        
        task.resume()
    }
    
}
