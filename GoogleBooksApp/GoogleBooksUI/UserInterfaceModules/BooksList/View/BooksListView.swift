//
//  ViewController.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import MBProgressHUD
import TTGSnackbar

class BooksListView: UIViewController {

  // MARK:- Properties
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var infoLabel: UILabel!
  @IBOutlet weak var progressView: UIView!

  var presenter: BooksListPresenter!

  var booksArray: [Book] = []

  // MARK:- Common functions
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "gBooks"
    setupVIPER()
    presenter.updateUserInterface()
    
    // Search Apple for the first time / on view did load - to not to show empty screen
    // perform(#selector(BooksListView.executeMockAppleSearchOnFirstTime), with: nil, afterDelay: 0.1)
  }
  
  func executeMockAppleSearchOnFirstTime() {
    searchBar.text = "Apple"
    performDelayedSearch()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

// MARK:- VIPER Setup
extension BooksListView {

  func setupVIPER() {
    if presenter == nil {
      presenter = BooksListPresenter()
      let interactor = BooksListInteractor()
      let wireframe = BooksListWireframe()
      presenter.interactor = interactor
      presenter.wireframe = wireframe
      presenter.view = self
      wireframe.view = self
      interactor.presenter = presenter
    }
  }

}

// MARK:- View Actions
extension BooksListView {

  func showHUD() {
    DispatchQueue.main.async {
      self.progressView.isHidden = false
      MBProgressHUD.showAdded(to: self.progressView, animated: false)
    }
  }

  func hideHUD() {
    DispatchQueue.main.async {
      MBProgressHUD.hide(for: self.progressView, animated: false)
      self.progressView.isHidden = true
    }
  }

  func showNetworkIndicator() {
    DispatchQueue.main.async {
      UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
  }

  func hideNetworkIndicator() {
    DispatchQueue.main.async {
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
  }
  
  func showSnackBarError(_ error: String) {
    let snackbar = TTGSnackbar(message: error, duration: .middle)
    DispatchQueue.main.async {
      snackbar.show()
    }
  }

  func showErrorMessage() {
    DispatchQueue.main.async {
      self.tableView.isHidden = true
      if let text = self.searchBar.text, text.characters.count > 0 {
        self.infoLabel.text = "No records found."
      } else {
        self.infoLabel.text = "Please enter text to search."
      }
    }
  }

  func reloadTableView() {
    DispatchQueue.main.async {
      self.tableView.isHidden = false
      self.tableView.reloadData()
      self.infoLabel.text = ""
    }
  }

}

extension BooksListView {

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    presenter.prepare(for: segue, sender: sender)
  }

}
