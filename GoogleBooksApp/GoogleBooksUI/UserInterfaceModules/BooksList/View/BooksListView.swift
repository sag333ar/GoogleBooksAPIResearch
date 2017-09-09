//
//  ViewController.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import MBProgressHUD

class BooksListView: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var responseGoogleBookList: GoogleBooksList? {
    didSet {
      DispatchQueue.main.async {
        if let list = self.responseGoogleBookList, let books = list.items {
          self.booksArray = books
          self.tableView.reloadData()
        }
      }
    }
  }

  var booksArray: [Book] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    GoogleBooksSDK.shared.executeGetBooksList("a", filter: GoogleBooksFilter.free_ebooks) { (response) in
      switch response {
      case .error(_ , let error):
        print("Error occured \(error.localizedDescription)")
      case .response(let booksList, _):
        self.responseGoogleBookList = booksList
      }
    }
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

extension BooksListView: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return booksArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    if let bookCell = cell as? BookListItemView {
      bookCell.setupCell(booksArray[indexPath.row])
    }
    return cell
  }

}

extension BooksListView: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}
