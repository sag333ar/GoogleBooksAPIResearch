//
//  BooksListView.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

extension BooksListView: UISearchBarDelegate {

  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
  }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    performDelayedSearch()
  }

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = ""
    searchBar.resignFirstResponder()
    performDelayedSearch()
  }

  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    performDelayedSearch()
  }

  func performDelayedSearch() {
    NSObject.cancelPreviousPerformRequests(withTarget: self)
    perform(#selector(BooksListView.performSearch), with: nil, afterDelay: 0.75)
  }

  func performSearch() {
    let filter = GoogleBooksFilter.fromInteger(self.searchBar.selectedScopeButtonIndex)
    if let text = searchBar.text, text.characters.count > 0 {
      presenter.searchBarDidUpdate(text, filter: filter)
    } else {
      presenter.searchBarDidUpdate("", filter: filter)
    }
  }

}
