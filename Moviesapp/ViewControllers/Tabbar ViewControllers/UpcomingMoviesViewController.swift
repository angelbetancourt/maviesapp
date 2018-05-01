//
//  UpcomingMoviesViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: BaseMoviesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Updater.fetchUpcomingMovies {[weak self] (movies, error) in
            
            if let error = error{
                self?.showSimpleAlert(error.localizedDescription)
                return
            }
            
            self?.movies = movies ?? []
        }
    }
}
