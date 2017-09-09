//
//  BookListItemView.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import SDWebImage

class BookListItemView: UITableViewCell {

  @IBOutlet weak var bookThumbImageView: UIImageView!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookAuthorLabel: UILabel!
  @IBOutlet weak var bookSubtitleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func setupCell(_ book: Book) {

    if let data = book.volumeInfo?.title {
      self.bookTitleLabel.text = data
    } else {
      self.bookTitleLabel.text = "Title not available"
    }

    if let data = book.volumeInfo?.subtitle {
      self.bookSubtitleLabel.text = data
    } else {
      self.bookSubtitleLabel.text = "Subtitle not available"
    }

    if let data = book.volumeInfo?.authors {
      self.bookAuthorLabel.text = data.joined(separator: ", ")
    } else {
      self.bookAuthorLabel.text = "Author not available"
    }

    self.bookThumbImageView.image = nil
    self.bookThumbImageView.sd_setShowActivityIndicatorView(true)
    self.bookThumbImageView.sd_setIndicatorStyle(.gray)
    if let data = book.volumeInfo?.imageLinks?.smallThumbnail, let url = URL(string: data) {
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
