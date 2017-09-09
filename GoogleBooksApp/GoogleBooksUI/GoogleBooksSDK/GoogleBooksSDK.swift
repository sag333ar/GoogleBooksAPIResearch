//
//  GoogleBooksSDK.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

public class GoogleBooksSDK: NSObject {

  static let shared = GoogleBooksSDK()

  private let getBooksList = GoogleBooksListService()

  private var getBooksListTask: URLSessionDataTask? = nil

  public func executeGetBooksList(_ query: String,
                                  filter: GoogleBooksFilter,
                                  start: Int,
                                  handler: @escaping (GoogleBooksListResponse) -> Void) {

    if let previousTask = getBooksListTask {
      previousTask.cancel()
      previousTask.suspend()
      getBooksListTask = nil
    }
    getBooksListTask = getBooksList.getBooksList(query,
                                                 filter: filter,
                                                 start: start,
                                                 handler: handler)
  }

}
