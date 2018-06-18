//
//  ListMoviesInteractor.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 6/18/18.
//  Copyright (c) 2018 Angel Betancourt. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListMoviesBusinessLogic
{
  func doSomething(request: ListMovies.Something.Request)
}

protocol ListMoviesDataStore
{
  //var name: String { get set }
}

class ListMoviesInteractor: ListMoviesBusinessLogic, ListMoviesDataStore
{
  var presenter: ListMoviesPresentationLogic?
  var worker: ListMoviesWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ListMovies.Something.Request)
  {
    worker = ListMoviesWorker()
    worker?.doSomeWork()
    
    let response = ListMovies.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
