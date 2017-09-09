
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

extension BookDetailsView {

  func loadUIData() {
    if let data = book?.volumeInfo?.title {
      self.bookTitleLabel.text = data
    } else {
      self.bookTitleLabel.text = "Title not available"
    }

    if let data = book?.volumeInfo?.subtitle {
      self.bookSubtitleLabel.text = data
    } else {
      self.bookSubtitleLabel.text = "Subtitle not available"
    }

    if let data = book?.volumeInfo?.authors {
      self.bookAuthorLabel.text = data.joined(separator: ", ")
    } else {
      self.bookAuthorLabel.text = "Author not available"
    }

    self.bookThumbImageView.image = nil
    self.bookThumbImageView.sd_setShowActivityIndicatorView(true)
    self.bookThumbImageView.sd_setIndicatorStyle(.gray)
    if let data = book?.volumeInfo?.imageLinks?.smallThumbnail, let url = URL(string: data) {
      self.bookThumbImageView.sd_setImage(with: url,
                                          completed: nil)
    }
    self.applyShadowToBookThumb()
  }

  func applyShadowToBookThumb() {
    self.bookThumbImageView.layer.borderColor = UIColor.black.cgColor
    self.bookThumbImageView.layer.borderWidth = 1
    self.bookThumbImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
    self.bookThumbImageView.layer.shadowRadius = 2
    self.bookThumbImageView.layer.shadowOpacity = 10
    self.bookThumbImageView.layer.shadowColor = UIColor.black.cgColor
  }

}

extension BookDetailsView {

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let title = book?.volumeInfo?.title {
      self.title = title
    } else {
      self.title = "Anonymos Book"
    }
  }

}
