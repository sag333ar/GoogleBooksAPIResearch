//
//  GoogleBooksServiceURL.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

public class ServiceURL {

  var serviceProtocol = "https"
  var serviceDomain = "www.googleapis.com"
  var context = "books"
  var version = "v1"
  var path = "volumes"

  init() {
    if let infoData = Bundle.main.infoDictionary {
      if let data = infoData["PROTOCOL"] as? String {
        self.serviceProtocol = data
      }
      if let data = infoData["DOMAIN"] as? String {
        self.serviceDomain = data
      }
      if let data = infoData["CONTEXT"] as? String {
        self.context = data
      }
      if let data = infoData["VERSION"] as? String {
        self.version = data
      }
      if let data = infoData["PATH"] as? String {
        self.path = data
      }
    }
  }

  var baseURL: String {
    return "\(serviceProtocol)://\(serviceDomain)/\(context)/\(version)/\(path)"
  }

  public static let shared = ServiceURL()

}
