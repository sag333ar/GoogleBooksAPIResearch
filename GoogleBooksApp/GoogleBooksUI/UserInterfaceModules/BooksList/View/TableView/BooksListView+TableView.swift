
//
//  BooksListView.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

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
  
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row == (self.booksArray.count-1) {
      presenter.didReachEndOfTable()
    }
  }

  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let book = booksArray[indexPath.row]
    return getEditingAccessories(book)
  }

  func getEditingAccessories(_ book: Book) -> [UITableViewRowAction] {
    var readBooksArray:[String] = []
    if let saved = UserDefaults.standard.value(forKey: "readbooks") as? [String] {
      readBooksArray = saved
    }
    if let bookid = book.id {
      if readBooksArray.contains(bookid) {
        let editAction = UITableViewRowAction(style: .normal, title: "Unread") { (rowAction, indexPath) in
          if let index = readBooksArray.index(of: bookid) {
            readBooksArray.remove(at: index)
            UserDefaults.standard.setValue(readBooksArray, forKey: "readbooks")
            UserDefaults.standard.synchronize()
            self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
          }
        }
        editAction.backgroundColor = UIColor.red
        return [editAction]
      } else {
        let editAction = UITableViewRowAction(style: .normal, title: "Read") { (rowAction, indexPath) in
          readBooksArray.append(bookid)
          UserDefaults.standard.setValue(readBooksArray, forKey: "readbooks")
          UserDefaults.standard.synchronize()
          self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        editAction.backgroundColor = UIColor.blue
        return [editAction]
      }
    } else {
      return []
    }
  }

}
