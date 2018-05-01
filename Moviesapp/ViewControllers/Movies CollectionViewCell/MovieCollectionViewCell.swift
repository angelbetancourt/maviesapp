//
//  MovieCollectionViewCell.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/30/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant =  (screenWidth / 3) - 24
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        subtitleLabel.text = nil
        voteLabel.text = "-"
        imageView.image = nil
    }
    
    
    func fillWithMovie(_ movie: Movie){
        
        //titleLabel.text = movie.title
        subtitleLabel.text = movie.releaseAge()
        
        if let voteCount = movie.voteCount{
            voteLabel.text = String(voteCount)
        
        }
        
        if let thumbnailBackdropUrl = movie.thumbnailPosterUrl(){
            imageView.af_setImage(withURL: thumbnailBackdropUrl)
            
        }
    }

}
