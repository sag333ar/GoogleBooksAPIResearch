//
//  BooksListWireframe.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

class BooksListWireframe {

  var view: BooksListView!

  func showBookDetailsScreen(with book: Book) {
    view.performSegue(withIdentifier: "booksToBooksDetailsSegue", sender: book)
  }

  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "booksToBooksDetailsSegue" {
      if let bookDetailsView = segue.destination as? BookDetailsView,
        let book = sender as? Book {
        bookDetailsView.setupVIPER()
        bookDetailsView.book = book
      }
    }
  }

}
