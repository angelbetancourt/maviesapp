//
//  MovieTableViewCell.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let reuseIdentifier = "MovieTableViewCellIdentifier"
    
    
    @IBOutlet weak var voteImageView: UIImageView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    
    func fillWithMovie(_ movie: Movie){
        
        titleLabel.text = movie.title
        subtitleLabel.text = movie.releaseDateDescription()
        
        if let voteCount = movie.voteCount{
            voteLabel.text = String(voteCount)
        }
        
        if let thumbnailBackdropUrl = movie.thumbnailBackdropUrl(){
            movieImageView.af_setImage(withURL: thumbnailBackdropUrl)
        
        }else if let thumbnailPosterUrl = movie.thumbnailPosterUrl(){
            movieImageView.af_setImage(withURL: thumbnailPosterUrl)
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        voteImageView.tintColor = UIColor.tmdbPrimaryColor
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        subtitleLabel.text = nil
        movieImageView.image = nil
        voteLabel.text = "-"
        
    }
}
