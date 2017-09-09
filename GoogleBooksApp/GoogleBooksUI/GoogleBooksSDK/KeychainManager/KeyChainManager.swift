//
//  KeyChainManager.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

class KeyChainManager {

  private static let keyToStore = "readbooks"

  func loadReadBooks() -> [String] {
    if let receivedData = KeyChain.load(key: KeyChainManager.keyToStore),
      let result = String(data: receivedData, encoding: String.Encoding.utf8) {
      let array = result.components(separatedBy: ",")
      return array
    }
    return []
  }

  func saveReadBooks(_ bookIds: [String]) {
    let singleString = bookIds.joined(separator: ",")
    if let data = singleString.data(using: String.Encoding.utf8) {
      let _ = KeyChain.save(key: KeyChainManager.keyToStore, data: data)
    }
  }

}
