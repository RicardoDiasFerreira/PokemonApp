//
//  PokemonInfoVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 29/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonInfoVC: UIViewController {
    
    var pokemonName:String!
    
    let infoView = UIView()
    let statsView = UIView()
    let evolutionView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureViews()
        getPokemonInformation()
        
    }
    
    init(name: String) {
        super.init(nibName: nil, bundle: nil)
        self.pokemonName = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            infoView.heightAnchor.constraint(equalToConstant: 250),
            
            statsView.topAnchor.constraint(equalTo: self.infoView.bottomAnchor, constant: 15),
            statsView.heightAnchor.constraint(equalToConstant: 180),
            
            evolutionView.topAnchor.constraint(equalTo: self.statsView.bottomAnchor, constant: 15),
            evolutionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func getPokemonInformation() {
        NetworkManager.shared.getPokemonInfo(name: self.pokemonName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self.configureUIElements(with: pokemon)
                }
                
            case .failure(let error):
                self.presentAlertVCOnMainTread(title: "Something was wrong", message: error.rawValue, btnText: "Ok")
            }
        }
    }
    
    private func configureUIElements(with pokemon: Pokemon) {
        self.add(childVC: PokemonMainInfoVC(with: pokemon), to: infoView)
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
