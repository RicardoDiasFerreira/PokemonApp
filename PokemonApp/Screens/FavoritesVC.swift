//
//  FavoritesVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 31/03/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
    }
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
