//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
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
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(ResultModel.self, from: data)
                completed(.success(result.results))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
