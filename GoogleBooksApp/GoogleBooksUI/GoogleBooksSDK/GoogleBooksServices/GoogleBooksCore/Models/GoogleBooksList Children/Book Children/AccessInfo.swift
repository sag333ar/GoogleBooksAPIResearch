//
//  AccessInfo.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit
import Gloss

public struct AccessInfo: Decodable {
  
  let country: String?
  let viewability: String?
  let embeddable: Bool?
  let publicDomain: Bool?
  let textToSpeechPermission: String?
  let epub: Epub?
  let pdf: Pdf?
  let webReaderLink: String?
  let accessViewStatus: String?
  let quoteSharingAllowed: Bool?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.country = "country" <~~ json
    self.viewability = "viewability" <~~ json
    self.embeddable = "embeddable" <~~ json
    self.publicDomain = "publicDomain" <~~ json
    self.textToSpeechPermission = "textToSpeechPermission" <~~ json
    self.epub = "epub" <~~ json
    self.pdf = "pdf" <~~ json
    self.webReaderLink = "webReaderLink" <~~ json
    self.accessViewStatus = "accessViewStatus" <~~ json
    self.quoteSharingAllowed = "quoteSharingAllowed" <~~ json
  }
  
}
