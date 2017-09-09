//
//  IndustryIdentifier.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct IndustryIdentifier: Decodable {

  let type: String?
  let identifier: String?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.type = "type" <~~ json
    self.identifier = "identifier" <~~ json
  }

}
