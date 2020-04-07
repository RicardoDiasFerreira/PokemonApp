//
//  PAPokemonsListVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PokemonsListVC: UIViewController {
    
    //only one section, for more sections add Section
    enum Section { case main }
    var pokemonCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, PokemonResults>!
    
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
        pokemonCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout(in: view))
        view.addSubview(pokemonCollectionView)
        pokemonCollectionView.backgroundColor = .systemBackground
        pokemonCollectionView.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.reuseID)
        
    }
    
    private func getPokemonsWithType() {
        NetworkManager.shared.getPokemonByType(type: pokemonType, completed: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
                self.updateData(on: self.pokemons)

            case.failure(let error):
                print("error-> \(error.rawValue)")
            }
        })
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, PokemonResults>(collectionView: pokemonCollectionView, cellProvider: { (pokemonCollectionView, indexPath, pokemonType) -> UICollectionViewCell? in
            let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.reuseID, for: indexPath) as! PokemonCell
            cell.set(pokemon: pokemonType.pokemon)
            cell.setBackgroundColorByPokemonType(type: self.pokemonType)
            return cell
        })
    }
    
    func updateData(on pokemon: [PokemonResults]) {
         var snapshot = NSDiffableDataSourceSnapshot<Section, PokemonResults>()
         snapshot.appendSections([.main])
         snapshot.appendItems(pokemon)
         DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
     }
    private func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 2
        
        //UICollectionViewFlowLayout concrete layout object that organizes items into a grid with optional header and footer views for each section.
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets.init(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize.init(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
        
}
