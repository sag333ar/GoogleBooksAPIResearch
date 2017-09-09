//
//  Epub.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct Epub: Decodable {

  let isAvailable: Bool?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.isAvailable = "isAvailable" <~~ json
  }

}
