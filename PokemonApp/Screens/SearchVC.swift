//
//  SearchVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 31/03/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let pokemonTypeTextField = PATextField()
    let searchButton = PAButton(backgroundColor: .systemRed, title: "GO!!!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, pokemonTypeTextField, searchButton)
        
        configureImageView()
        configureTextField()
        configureSearchButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = Images.logoImage
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureTextField() {
        //        usernameTextField.delegate = self
        let padding:CGFloat = 50
        
        NSLayoutConstraint.activate([
            pokemonTypeTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: padding),
            pokemonTypeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            pokemonTypeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            pokemonTypeTextField.heightAnchor.constraint(equalToConstant: padding)
        ])
    }
    
    private func configureSearchButton() {
        //        searchButton -> add on click event
        searchButton.addTarget(self, action: #selector(pushPokemonListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func pushPokemonListVC() {
        print("oupaaaaaa")
    }
    
}
