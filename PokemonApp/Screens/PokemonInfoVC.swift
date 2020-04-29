//
//  PokemonInfoVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 29/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonInfoVC: UIViewController {
    
    let infoView = UIView()
    let statsView = UIView()
    let evolutionView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureViews()

    }
    
    private func configureViews() {
        
        let views = [infoView, statsView, evolutionView]
        
        for view in views {
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemRed
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
            ])
        }
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
            infoView.heightAnchor.constraint(equalToConstant: 300),
            
            statsView.topAnchor.constraint(equalTo: self.infoView.bottomAnchor, constant: 15),
            statsView.heightAnchor.constraint(equalToConstant: 250),

            evolutionView.topAnchor.constraint(equalTo: self.statsView.bottomAnchor, constant: 15),
            evolutionView.heightAnchor.constraint(equalToConstant: 150),

        
        ])
        
    }
}
