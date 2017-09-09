//
//  BooksListInteractor.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

class BooksListInteractor {

  var presenter: BooksListPresenter!
  
  func executeSearch(_ query: String,
                     start: Int,
                     filter: GoogleBooksFilter,
                     handler: @escaping (GoogleBooksListResponse) -> Void) {

    let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    GoogleBooksSDK.shared.executeGetBooksList(query, filter: filter, start: start) { (response) in
      handler(response)

    }
  }

}
