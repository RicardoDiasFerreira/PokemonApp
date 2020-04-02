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
    let pickerView = UIPickerView()
    let searchButton = PAButton(backgroundColor: .systemRed, title: "GO!!!")
    
    var pokemonTypes:[PokemonType] = []
    var selectedType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, pickerView, searchButton)
        
        configureImageView()
        configurePickerView()
        configureSearchButton()
        
        getPokemonTypes()
        
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
    
    private func configurePickerView() {
        let padding:CGFloat = 50
        pickerView.delegate = self
        pickerView.layer.borderColor = UIColor.red.cgColor
        pickerView.layer.cornerRadius = 16
        pickerView.layer.borderWidth = 1
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: padding),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            pickerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureSearchButton() {
        searchButton.addTarget(self, action: #selector(pushPokemonListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func getPokemonTypes() {
        NetworkManager.shared.getPokemonTypes {[weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let types):
                self.pokemonTypes = types
                DispatchQueue.main.async {
                    self.pickerView.reloadComponent(.zero)
                }
            case.failure(let error):
                print("fodeu-> \(error.rawValue)")
            }
        }
        
    }
    
    @objc func pushPokemonListVC() {
        let pokemonsListVC = PokemonsListVC()
        pokemonsListVC.pokemonType = selectedType
        navigationController?.pushViewController(pokemonsListVC, animated: true)
    }
    
}

extension SearchVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = pokemonTypes[row].name.capitalizingFirstLetter()
    }
}

extension SearchVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        pickerView.subviews.forEach({ $0.isHidden = $0.frame.height < 1.0 })
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemonTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pokemonTypes[row].name
    }
    
}
