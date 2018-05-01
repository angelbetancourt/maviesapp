//
//  TopRatedMoviesViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

class TopRatedMoviesViewController: BaseMoviesViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Updater.fetchTopRatedMovies {[weak self] (movies, error) in
            
            if let error = error{
                self?.showSimpleAlert(error.localizedDescription)
                return
            }
            
            self?.movies = movies ?? []
            //self?.moviesCollectionViewController?.movies = movies ?? []
        }
        
    }

    
    

}
