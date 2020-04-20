//
//  PAPokemonsListVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonsListVC: UIViewController {
    
    var pokemonsCV: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CVSection, PokemonResults>!
    
    var pokemonType:String!
    var pokemons:[PokemonResults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = pokemonType.capitalizingFirstLetter()
        
        configureCollectionView()
        getPokemonsWithType()
        configureDataSource()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    init(pokemonType: String) {
        super.init(nibName: nil, bundle: nil)
        self.pokemonType = pokemonType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        pokemonsCV = UICollectionView(frame: view.bounds, collectionViewLayout: view.createTwoColumnFlowLayout())
        view.addSubview(pokemonsCV)
        pokemonsCV.backgroundColor = .systemBackground
        pokemonsCV.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.reuseID)
        
    }
    
    private func getPokemonsWithType() {
        NetworkManager.shared.getPokemonByType(type: pokemonType, completed: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
                self.updateData(on: self.pokemons)
                
            case.failure(let error):
                self.presentAlertVCOnMainTread(title: "Error", message: error.rawValue, btnText: "Ok")
            }
        })
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<CVSection, PokemonResults>(collectionView: pokemonsCV, cellProvider: { (pokemonCollectionView, indexPath, pokemonType) -> UICollectionViewCell? in
            let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.reuseID, for: indexPath) as! PokemonCell
            cell.set(pokemon: pokemonType.pokemon)
            cell.setBackgroundColorByPokemonType(type: self.pokemonType)
            return cell
        })
    }
    
    func updateData(on pokemon: [PokemonResults]) {
        var snapshot = NSDiffableDataSourceSnapshot<CVSection, PokemonResults>()
        snapshot.appendSections([.main])
        snapshot.appendItems(pokemon)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
}
