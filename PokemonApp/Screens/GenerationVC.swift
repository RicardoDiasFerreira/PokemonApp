//
//  GenerationVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 01/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class GenerationVC: UIViewController {
    
    var generations:[GenModel] = []
        
    var generationsCV: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CVSection, GenModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Generations"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureCollectionView()
        getPokemonGenerations()
        configureDataSource()

    }
    
    private func configureCollectionView() {
        generationsCV = UICollectionView(frame: view.bounds, collectionViewLayout: view.createTwoColumnFlowLayout())
        generationsCV.delegate =  self
        view.addSubview(generationsCV)
        generationsCV.backgroundColor = .systemBackground
        generationsCV.register(GenerationCell.self, forCellWithReuseIdentifier: GenerationCell.reuseID)
    }
    
    private func getPokemonGenerations() {
        NetworkManager.shared.getPokemonGenerations(completed: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let gens):
                self.generations.append(contentsOf: gens)
                self.updateData(on: gens)
            case .failure(let error):
                self.presentAlertVCOnMainTread(title: "Error", message: error.rawValue, btnText: "Ok")
            }
            
        })
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<CVSection, GenModel>(collectionView: generationsCV, cellProvider: { (generationsCV, indexPath, generation) -> UICollectionViewCell? in
            let cell = generationsCV.dequeueReusableCell(withReuseIdentifier: GenerationCell.reuseID, for: indexPath) as! GenerationCell
            cell.set(name: generation.name)
            return cell
        })
    }
    
    func updateData(on gens: [GenModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<CVSection, GenModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(gens)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
}

extension GenerationVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pokemonsListVC = PokemonsListVC(with: "Gen")
        navigationController?.pushViewController(pokemonsListVC, animated: true)
        
    }
}
