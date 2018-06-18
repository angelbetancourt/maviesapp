//
//  ListMoviesViewController.swift
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

protocol ListMoviesDisplayLogic: class
{
  func displaySomething(viewModel: ListMovies.Something.ViewModel)
}

class ListMoviesViewController: UIViewController, ListMoviesDisplayLogic
{
  var interactor: ListMoviesBusinessLogic?
  var router: (NSObjectProtocol & ListMoviesRoutingLogic & ListMoviesDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ListMoviesInteractor()
    let presenter = ListMoviesPresenter()
    let router = ListMoviesRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = ListMovies.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: ListMovies.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
