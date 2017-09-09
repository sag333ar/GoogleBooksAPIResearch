//
//  VolumeInfo.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

import Gloss

public struct VolumeInfo: Decodable {

  let title: String?
  let subtitle: String?
  let authors: [String]?
  let publishedDate: String?
  let industryIdentifiers: [IndustryIdentifier]?
  let readingMode: ReadingMode?
  let pageCount: Int?
  let printType: String?
  let categories: [String]?
  let maturityRating: String?
  let allowAnonLogging: Bool?
  let contentVersion: String?
  let imageLinks: ImageLink?
  let language: String?
  let previewLink: String?
  let infoLink: String?
  let canonicalVolumeLink: String?

  // MARK: - Deserialization
  public init?(json: JSON) {
    self.title = "title" <~~ json
    self.subtitle = "subtitle" <~~ json
    self.authors = "authors" <~~ json
    self.publishedDate = "publishedDate" <~~ json
    self.industryIdentifiers = "industryIdentifiers" <~~ json
    self.readingMode = "readingMode" <~~ json
    self.pageCount = "pageCount" <~~ json
    self.printType = "printType" <~~ json
    self.categories = "categories" <~~ json
    self.maturityRating = "maturityRating" <~~ json
    self.allowAnonLogging = "allowAnonLogging" <~~ json
    self.contentVersion = "contentVersion" <~~ json
    self.imageLinks = "imageLinks" <~~ json
    self.language = "language" <~~ json
    self.previewLink = "previewLink" <~~ json
    self.infoLink = "infoLink" <~~ json
    self.canonicalVolumeLink = "canonicalVolumeLink" <~~ json
  }

}
