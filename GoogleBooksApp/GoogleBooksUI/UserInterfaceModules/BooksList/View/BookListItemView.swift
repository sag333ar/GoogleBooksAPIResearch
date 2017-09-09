//
//  BookListItemView.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

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
      self.bookAuthorLabel.text = "Title not available"
    }
  }

}
