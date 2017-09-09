//
//  GoogleBooksList.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct GoogleBooksList: Decodable {

  let kind: String?
  let totalItems: Int?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.kind = "kind" <~~ json
    self.totalItems = "totalItems" <~~ json
  }

}
