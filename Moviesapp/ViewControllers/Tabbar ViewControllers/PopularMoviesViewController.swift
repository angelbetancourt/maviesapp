//
//  PopularMoviesViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit
import AlamofireImage

class PopularMoviesViewController: BaseMoviesViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Updater.fetchMostPopularMovies {[weak self] (movies, error) in
            
            if let error = error{
                self?.showSimpleAlert(error.localizedDescription)
                return
            }
            
            self?.movies = movies ?? []
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}



