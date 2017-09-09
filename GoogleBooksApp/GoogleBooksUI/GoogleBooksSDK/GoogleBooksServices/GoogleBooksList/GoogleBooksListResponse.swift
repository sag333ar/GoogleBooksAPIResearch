//
//  GoogleBooksListResponse.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

public enum GoogleBooksListResponse {
  case response(GoogleBooksList, URLResponse?)
  case error(URLResponse?, Error)
}
