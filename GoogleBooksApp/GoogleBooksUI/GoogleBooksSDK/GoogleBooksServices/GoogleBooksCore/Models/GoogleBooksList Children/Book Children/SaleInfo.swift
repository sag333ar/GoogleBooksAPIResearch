//
//  SaleInfo.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct SaleInfo: Decodable {

  let country: String?
  let saleability: String?
  let isEbook: Bool?
  let buyLink: String?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.country = "country" <~~ json
    self.saleability = "saleability" <~~ json
    self.isEbook = "isEbook" <~~ json
    self.buyLink = "buyLink" <~~ json
  }

}
