//
//  MoviePosterPageViewController.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/28/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import UIKit


class MoviePosterPageViewController: UIPageViewController{
    
    
    var movie: Movie?{
        didSet{
            guard isViewLoaded else { return }
            (pages[0] as! MoviePosterViewController).imageUrl = movie?.posterUrl()
            //(pages[1] as! MoviePosterViewController).imageUrl = movie?.backdropUrl()
        }
    }
    
    fileprivate lazy var pages: [UIViewController] = {
        
        let page1 = storyboard!.instantiateViewController(withIdentifier: "MoviePosterViewController") as! MoviePosterViewController
        page1.imageUrl = movie?.posterUrl()
        
        //let page2 = storyboard!.instantiateViewController(withIdentifier: "MoviePosterViewController") as! MoviePosterViewController
        //page2.imageUrl = movie?.backdropUrl()
        
        return [page1]
    }()
    
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate   = self
        
        if let firstVC = pages.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension MoviePosterPageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0          else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
}

extension MoviePosterPageViewController: UIPageViewControllerDelegate { }

