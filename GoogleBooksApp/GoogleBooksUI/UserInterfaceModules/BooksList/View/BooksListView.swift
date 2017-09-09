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

  var booksArray: [Book] = [] {
    didSet {
      reloadTableView()
    }
  }

  // MARK:- Common functions
  override func viewDidLoad() {
    super.viewDidLoad()
    onViewLoad()
    reloadTableView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

// MARK:- VIPER Setup
extension BooksListView {

  func onViewLoad() {
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

  func reloadTableView() {
    DispatchQueue.main.async {
      if self.booksArray.count > 0 {
        self.tableView.isHidden = false
        self.tableView.reloadData()
        self.infoLabel.text = ""
      } else {
        self.tableView.isHidden = true
        if (self.searchBar.text?.characters.count)! > 0 {
          self.infoLabel.text = "No records found."
        } else {
          self.infoLabel.text = "Please enter text to search."
        }
      }
    }
  }

}
