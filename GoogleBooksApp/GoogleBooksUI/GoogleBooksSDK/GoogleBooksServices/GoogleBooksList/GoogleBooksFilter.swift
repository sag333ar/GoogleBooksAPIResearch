//
//  GoogleBooksFilter.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

public enum GoogleBooksFilter: String {

  case ebooks
  case free_ebooks
  case full
  case paid_ebooks
  case partial

  var description: String {
    switch self {
    case .ebooks:
      return "ebooks"
    case .free_ebooks:
      return "free-ebooks"
    case .full:
      return "full"
    case .paid_ebooks:
      return "paid-ebooks"
    case .partial:
      return "partial"
    }
  }

  public static func fromInteger(_ value: Int) -> GoogleBooksFilter {
    switch value {
    case 0:
      return GoogleBooksFilter.ebooks
    case 1:
      return GoogleBooksFilter.free_ebooks
    case 2:
      return GoogleBooksFilter.full
    case 3:
      return GoogleBooksFilter.paid_ebooks
    case 4:
      return GoogleBooksFilter.partial
    default:
      return GoogleBooksFilter.ebooks
    }
  }

}
