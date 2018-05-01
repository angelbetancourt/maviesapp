//
//  MoviesCollectionViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MovieCollectionViewCell"

class MoviesCollectionViewController: UICollectionViewController {

    var searchText: String?
    
    var movies: [Movie] = []{
        didSet{
            guard isViewLoaded else { return }
            collectionView?.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(UINib(nibName: "MovieCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        
        if let flow = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flow.estimatedItemSize = CGSize(width: 100, height: 260)
        }
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
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        cell.fillWithMovie(movies[indexPath.row])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectMovie(movies[indexPath.row])
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
