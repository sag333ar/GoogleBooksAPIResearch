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

  var presenter: BooksListPresenter!

  var booksArray: [Book] = []

  // MARK:- Common functions
  override func viewDidLoad() {
    super.viewDidLoad()
    onViewLoad()
    presenter.updateUserInterface()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

// MARK:- VIPER Setup
extension BooksListView {

  func onViewLoad() {
    self.title = "gBooks From Sagar Kothari"
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

// MARK:- View Actions
extension BooksListView {

  func showHUD() {
    DispatchQueue.main.async {
      self.tableView.isHidden = false
      MBProgressHUD.showAdded(to: self.tableView, animated: false)
    }
  }

  func hideHUD() {
    DispatchQueue.main.async {
      MBProgressHUD.hide(for: self.tableView, animated: false)
    }
  }

  func showSnackBarError(_ error: String) {
    let snackbar = TTGSnackbar(message: error, duration: .short)
    DispatchQueue.main.async {
      snackbar.show()
    }
  }

  func showTableData() {
    
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
