//
//  BookDetailWireframe.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import SafariServices

class BookDetailsWireframe {

  var view: BookDetailsView!

}

extension BookDetailsWireframe {

  func showInfo(_ urlString: String) {
    if let url = URL(string: urlString) {
      let svc = SFSafariViewController(url: url)
      svc.title = "Information of Book"
      view.navigationController?.pushViewController(svc, animated: true)
    }
  }

  func showWebReader(_ urlString: String) {
    if let url = URL(string: urlString) {
      let svc = SFSafariViewController(url: url)
      svc.title = "Webreader of Book"
      view.navigationController?.pushViewController(svc, animated: true)
    }
  }

}
