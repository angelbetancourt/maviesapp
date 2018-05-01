//
//  MovieDetailViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit
import WebKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var contentViewConstraint: NSLayoutConstraint!
    //@IBOutlet weak var postersContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var movieDetailStackView: UIStackView!
    @IBOutlet weak var webView: WKWebView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fill()
        
        guard let movie = movie else {
            return
        }
        
        showActivityIndicator()
        Updater.fetchMovie(movie.id) {[weak self] (movie, error) in
            
            self?.hideActivityIndicator()
            if let error = error{
                self?.showSimpleAlert(error.localizedDescription)
                return
            }
            
            self?.movie = movie
            self?.fill()
        }
    }
    
    
    func fill(){
        
        guard let movie = movie else {
            return
        }

        
        titleLabel.text = movie.title
        overViewLabel.text = movie.overview
        releaseDateLabel.text = movie.releaseDateDescription()
        
        if let posterUrl = movie.posterUrl(){
            posterImageView.af_setImage(withURL: posterUrl)
        }
        
        if let trailer = movie.trailerVideo(), let url = trailer.videoUrl(){
            webView.load(URLRequest(url: url))
        }
        
        languagesLabel.text = movie.spokenLanguages.compactMap({ return $0.name }).joined(separator: ", ")
        
        genresLabel.text = movie.genres.compactMap({ return $0.name }).joined(separator: ", ")
        
        fitContent()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        fitContent()
    }
    
    
    func fitContent(){
        
        
        let detailH = movieDetailStackView.frame.size.height + 240
        
        let posterH = posterImageView.frame.size.height
        
        let size = CGSize(width: view.frame.size.width, height: detailH + posterH + 12)
        
        scrollView.contentSize = size
        
        contentViewConstraint.constant = size.height
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let moviePosterPageViewController = segue.destination as? MoviePosterPageViewController{
            moviePosterPageViewController.movie = movie
        }
    }
}
