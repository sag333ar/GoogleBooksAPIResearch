//
//  Pdf.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct Pdf: Decodable {
  
  let isAvailable: Bool?
  let downloadLink: String?
  
  // MARK: - Deserialization
  public init?(json: JSON) {
    self.isAvailable = "isAvailable" <~~ json
    self.downloadLink = "downloadLink" <~~ json
  }
  
}
