//
//  MoviePosterViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/28/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit

class MoviePosterViewController: UIViewController {

    var imageUrl: URL?
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let imageUrl = imageUrl else { return }
        imageView.af_setImage(withURL: imageUrl)
        
    }

}
