//
//  ImageLink.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct ImageLink: Decodable {

  let smallThumbnail: String?
  let thumbnail: String?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.smallThumbnail = "smallThumbnail" <~~ json
    self.thumbnail = "thumbnail" <~~ json
  }

}
