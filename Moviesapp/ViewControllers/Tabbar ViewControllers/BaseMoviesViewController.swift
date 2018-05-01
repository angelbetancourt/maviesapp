//
//  BaseMoviesViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

class BaseMoviesViewController: UIViewController {

    @IBOutlet weak var moviesCollectionViewController: MoviesCollectionViewController?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchText: String?
    
    var movies: [Movie] = []{
        didSet{
            refreshResults()
        }
    }
    
    var filteredMovies: [Movie] = []{
        didSet{
            guard isViewLoaded else { return }
            tableView?.reloadSections(IndexSet(integer: 0), with: .fade)
            moviesCollectionViewController?.movies = filteredMovies
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 100
        tableView?.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
        
        tableView?.delegate = self
        tableView?.dataSource =  self
        searchBar?.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(false)
    }
    
    func didSelectMovie(_ movie: Movie){
        showMovie(movie)
    }
    
    func showMovie(_ movie: Movie){
        
        let movieDetailstoryboatd = UIStoryboard(name: "MovieDetail", bundle: Bundle.main)
        
        let movieDetailViewController = movieDetailstoryboatd.instantiateInitialViewController() as! MovieDetailViewController
        
        movieDetailViewController.movie = movie
        show(movieDetailViewController, sender: self)
    }
    
    
    func refreshResults(){
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            filteredMovies = movies
            return
        }
        
        filteredMovies = movies.filter({ return $0.title.lowercased().contains(searchText.lowercased()) })
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let moviesCollectionViewController = segue.destination as? MoviesCollectionViewController{
            self.moviesCollectionViewController = moviesCollectionViewController
        }
    }
}







extension BaseMoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    //Mark: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier) as! MovieTableViewCell
        cell.fillWithMovie(filteredMovies[indexPath.row])
        return cell
    }
    
    
    //Mark: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectMovie(filteredMovies[indexPath.row])
    }
    
    
    
}



extension BaseMoviesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchText = searchText
        refreshResults()
    }
}
