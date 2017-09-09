
//
//  BooksDetailView.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

class BookDetailsView: UIViewController {

  // MARK:- Properties
  @IBOutlet weak var bookThumbImageView: UIImageView!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookAuthorLabel: UILabel!
  @IBOutlet weak var bookSubtitleLabel: UILabel!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  
  var book: Book?

  var presenter: BookDetailsPresenter!

  // MARK:- Common functions
  override func viewDidLoad() {
    super.viewDidLoad()
    setupVIPER()
    loadUIData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

// MARK:- VIPER Setup
extension BookDetailsView {

  func setupVIPER() {
    if presenter == nil {
      presenter = BookDetailsPresenter()
      let interactor = BookDetailsInteractor()
      let wireframe = BookDetailsWireframe()
      presenter.interactor = interactor
      presenter.wireframe = wireframe
      presenter.view = self
      wireframe.view = self
      interactor.presenter = presenter
    }
  }

}

// MARK:- IBActions
extension BookDetailsView {

  @IBAction func btnInfoTapped(_ sender: Any?) {
    if let urlString = book?.volumeInfo?.previewLink {
      presenter.showInfo(urlString)
    } else {
      
    }
  }

  @IBAction func btnWebReadTapped(_ sender: Any?) {
    if let urlString = book?.accessInfo?.webReaderLink {
      presenter.showWebReader(urlString)
    } else {
      
    }
  }

}
