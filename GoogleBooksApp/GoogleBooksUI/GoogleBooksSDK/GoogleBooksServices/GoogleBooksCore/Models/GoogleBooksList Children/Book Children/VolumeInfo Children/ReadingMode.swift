//
//  ReadingMode.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct ReadingMode: Decodable {

  let text: Bool?
  let image: Bool?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.text = "text" <~~ json
    self.image = "image" <~~ json
  }

}
