//
//  BookDetailsView+Setup.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

extension BookDetailsView {
  
  func loadUIData() {
    setTitleAndAuthor()
    setSubtitleText()
    prepareBookThumb()
    setTitleForNavigationBar()
  }
  
  func setTitleAndAuthor() {
    if let data = book?.volumeInfo?.title {
      bookTitleLabel.text = data
    } else {
      bookTitleLabel.text = "Title not available"
    }
    
    if let data = book?.volumeInfo?.authors {
      bookAuthorLabel.text = data.joined(separator: ", ")
    } else {
      bookAuthorLabel.text = "Author not available"
    }
  }
  
  func setSubtitleText() {
    if let data = book?.volumeInfo?.subtitle {
      bookSubtitleLabel.text = data
    } else {
      bookSubtitleLabel.text = "Subtitle not available."
    }
    
    if let data = book?.volumeInfo?.pageCount {
      bookSubtitleLabel.text = bookSubtitleLabel.text!
        + "\n\nThere are \(data) pages."
    } else {
      bookSubtitleLabel.text = bookSubtitleLabel.text!
        + "\n\nNumber of pages info not available."
    }
    
    if let data = book?.accessInfo?.pdf?.isAvailable {
      bookSubtitleLabel.text = bookSubtitleLabel.text!
        + "\n\nPDF \(data == true ? "available." : "not available.")"
    } else {
      bookSubtitleLabel.text = bookSubtitleLabel.text!
        + "\n\nPDF info is not available."
    }
    
    if let data = book?.volumeInfo?.printType {
      bookSubtitleLabel.text = bookSubtitleLabel.text!
        + "\n\nPrint type is \(data)"
    } else {
      bookSubtitleLabel.text = bookSubtitleLabel.text!
        + "\n\nPrint type info is not available."
    }
  }
  
  func setTitleForNavigationBar() {
    if let title = book?.volumeInfo?.title {
      self.title = title
    } else {
      self.title = "Anonymos Book"
    }
  }
  
  func prepareBookThumb() {
    bookThumbImageView.image = nil
    bookThumbImageView.sd_setShowActivityIndicatorView(true)
    bookThumbImageView.sd_setIndicatorStyle(.gray)
    if let data = book?.volumeInfo?.imageLinks?.smallThumbnail, let url = URL(string: data) {
      self.bookThumbImageView.sd_setImage(with: url,
                                          completed: nil)
    }
    bookThumbImageView.layer.borderColor = UIColor.black.cgColor
    bookThumbImageView.layer.borderWidth = 1
    bookThumbImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
    bookThumbImageView.layer.shadowRadius = 2
    bookThumbImageView.layer.shadowOpacity = 10
    bookThumbImageView.layer.shadowColor = UIColor.black.cgColor
  }
  
}

extension BookDetailsView {
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    scrollView.contentSize = CGSize(width: view.frame.size.width, height: stackView.frame.size.height + 30)
  }
  
}
