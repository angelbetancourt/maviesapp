//
//  SearchMoviesViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/28/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

class SearchMoviesViewController: BaseMoviesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func refreshResults(){
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            filteredMovies = movies
            
            showSimpleAlert("Type some test in the searchbar")
            return
        }
        
        guard Reachability.isConnectedToNetwork() else {
            
            showSimpleAlert("For online search you need internet connection")
            return
        }

        
        showActivityIndicator()
        Updater.searchMovies(searchText) {[weak self] (movies, error) in
            
            self?.hideActivityIndicator()
            if let error = error{
                self?.showSimpleAlert(error.localizedDescription)
                return
            }
            
            self?.view.endEditing(false)
            self?.movies = movies ?? []
            self?.filteredMovies = movies ?? []
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(false)
    }

}
