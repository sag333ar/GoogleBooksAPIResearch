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

  var responseGoogleBookList: GoogleBooksList? {
    didSet {
      if let list = self.responseGoogleBookList, let books = list.items {
        self.view.booksArray += books
      }
    }
  }

  private func executeSearch(_ query: String, filter: GoogleBooksFilter) {
    view.showHUD()
    interactor.executeSearch(query, filter: filter) { (response) in
      self.view.hideHUD()
      switch response {
      case .error(_ , let error):
        self.view.showSnackBarError(error.localizedDescription)
      case .response(let booksList, _):
        self.responseGoogleBookList = booksList
      }
    }
  }

  func searchBarDidUpdate(_ query: String, filter: GoogleBooksFilter) {
    var query = query.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    if query.characters.count > 0 {
      executeSearch(query, filter: filter)
    } else {
      view.booksArray = []
    }
  }

}
