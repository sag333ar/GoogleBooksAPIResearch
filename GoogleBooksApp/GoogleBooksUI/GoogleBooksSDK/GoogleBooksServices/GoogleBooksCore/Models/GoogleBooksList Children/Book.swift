//
//  Book.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct Book: Decodable {

  let kind: String?
  let id: String?
  let etag: String?
  let selfLink: String?
  let volumeInfo: VolumeInfo?
  let saleInfo: SaleInfo?
  let accessInfo: AccessInfo?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.kind = "kind" <~~ json
    self.id = "id" <~~ json
    self.etag = "etag" <~~ json
    self.selfLink = "selfLink" <~~ json
    self.volumeInfo = "volumeInfo" <~~ json
    self.saleInfo = "saleInfo" <~~ json
    self.accessInfo = "accessInfo" <~~ json
  }

}
