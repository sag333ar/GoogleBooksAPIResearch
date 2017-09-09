//
//  BooksDetailPresenter.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

class BookDetailsPresenter {

  var view: BookDetailsView!
  var interactor: BookDetailsInteractor!
  var wireframe: BookDetailsWireframe!

}

// MARK:- Communication to Wireframe
extension BookDetailsPresenter {

  func showInfo(_ urlString: String) {
    wireframe.showInfo(urlString)
  }

  func showWebReader(_ urlString: String) {
    wireframe.showWebReader(urlString)
  }

}
