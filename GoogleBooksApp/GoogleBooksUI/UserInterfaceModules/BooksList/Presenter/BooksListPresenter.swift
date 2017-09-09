//
//  BooksListPresenter.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

class BooksListPresenter {

  var view: BooksListView!
  var interactor: BooksListInteractor!
  var wireframe: BooksListWireframe!
  var start: Int = 0

  var responseGoogleBookList: GoogleBooksList? {
    didSet {
      if let list = responseGoogleBookList, let books = list.items {
        if start == 0 {
          self.view.booksArray = books
        } else {
          self.view.booksArray += books
        }
      }
    }
  }

  private func executeSearch(_ query: String, start: Int = 0, filter: GoogleBooksFilter) {
    view.showHUD()
    self.start = start
    if start == 0 {
      view.booksArray = []
      view.reloadTableView()
    }
    interactor.executeSearch(query, start: start, filter: filter) { (response) in
      self.view.hideHUD()
      switch response {
      case .error(_ , let error):
        self.view.showSnackBarError(error.localizedDescription)
      case .response(let booksList, _):
        self.responseGoogleBookList = booksList
        self.updateUserInterface()
      }
    }
  }

  func searchBarDidUpdate(_ query: String, filter: GoogleBooksFilter) {
    var query = query.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    if query.characters.count > 0 {
      executeSearch(query, filter: filter)
    } else {
      view.booksArray = []
      updateUserInterface()
    }
  }

  func didReachEndOfTable() {
    let filter = GoogleBooksFilter.fromInteger(view.searchBar.selectedScopeButtonIndex)
    if let items = responseGoogleBookList?.totalItems,
      let text = view.searchBar.text,
      text.characters.count > 0,
      view.booksArray.count < items {
      executeSearch(text, start: view.booksArray.count, filter: filter)
    }
  }

  func updateUserInterface() {
    if view.booksArray.count > 0 {
      view.reloadTableView()
    } else {
      view.showErrorMessage()
    }
  }

  func getEditingAccessories(_ book: Book) -> [UITableViewRowAction] {
    var readBooksArray:[String] = GoogleBooksSDK.shared.loadReadBooks()
    if let bookid = book.id {
      if readBooksArray.contains(bookid) {
        let editAction = UITableViewRowAction(style: .normal, title: "Unread") { (rowAction, indexPath) in
          if let index = readBooksArray.index(of: bookid) {
            readBooksArray.remove(at: index)
            GoogleBooksSDK.shared.saveReadBooks(readBooksArray)
            self.view.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
          }
        }
        editAction.backgroundColor = UIColor.red
        return [editAction]
      } else {
        let editAction = UITableViewRowAction(style: .normal, title: "Read") { (rowAction, indexPath) in
          readBooksArray.append(bookid)
          GoogleBooksSDK.shared.saveReadBooks(readBooksArray)
          self.view.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        editAction.backgroundColor = UIColor.blue
        return [editAction]
      }
    } else {
      return []
    }
  }
  
}
