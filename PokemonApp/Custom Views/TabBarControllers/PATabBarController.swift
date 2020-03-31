//
//  PATabBarController.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 31/03/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PATabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemRed
        viewControllers = [createSearchNC(), createFavoritesNC()]

    }
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC(title: "Search")
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    private func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesVC(title: "Favorites")
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesVC)
    }
}
