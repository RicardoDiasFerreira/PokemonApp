//
//  FavoritesVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 31/03/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    
    let tableView = UITableView()
    var pokemons:[Pokemon] = []
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)

        //Registers a class for use in creating new table cells.
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
        
    }
    
    func getFavorites() {
//        PersistenceManager.retrieveFavorites { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case .success(let favorites):
//                self.updateUI(with: favorites)
//
//            case .failure(let error):
//                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
//                break
//            }
//        }
    }
    
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
//        cell.set(favorite: pokemons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = pokemons[indexPath.row]
        let destVC = PokemonInfoVC(name: favorite.name)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        
//        PersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType:.remove) { [weak self] error in
//            guard let self = self else { return }
//            guard let error = error else {
//                self.favorites.remove(at: indexPath.row);
//                tableView.deleteRows(at: [indexPath], with: .left)
//                return
//            }
//            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
//        }
    }
    
}
