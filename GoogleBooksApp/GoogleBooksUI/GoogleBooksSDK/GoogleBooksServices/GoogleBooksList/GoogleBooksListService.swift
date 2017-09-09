//
//  GoogleBooksList.swift
//  GoogleBooksApp
//
//  Created by Kothari, Sagar on 9/9/17.
//  Copyright © 2017 Sagar Kothari. All rights reserved.
//

import UIKit

// Following pod/framework created by me (https://github.com/sag333ar/SKRequestManager)
import SKRequestManager

public class GoogleBooksListService {
  
  private static let responseArrayError = NSError(domain: "GoogleBooksListService",
                                                  code: 601,
                                                  userInfo: ["Error occured. Response json is in array format": NSLocalizedDescriptionKey])

  private static let responseDataError = NSError(domain: "GoogleBooksListService",
                                                  code: 602,
                                                  userInfo: ["Error occured. Invalid response received": NSLocalizedDescriptionKey])

  public func getBooksList(_ query: String,
                                 filter: GoogleBooksFilter,
                                 start: Int,
                                 handler: @escaping (GoogleBooksListResponse) -> Void) -> URLSessionDataTask {

    let queryParams = RequestManager.generateQueryString(
      [
        "q": query,
        "filter": filter.description,
        "maxResults": "40",
        "startIndex": "\(start)",
        "key": ServiceURL.shared.key
      ])
    let urlString = ServiceURL.shared.baseURL + queryParams
    let request = RequestManager.generateRequest(urlString,
                                   dictionaryOfHeaders: nil,
                                   postData: nil,
                                   requestType: RequestType.Get,
                                   timeOut: 60)
    return RequestManager.invokeRequestForJSON(request) { (response: JSONResponse) in
      switch response {
      case .array(_, let urlResponse):

        handler(GoogleBooksListResponse.error(
          urlResponse,
          GoogleBooksListService.responseArrayError))

      case .dictionary(let object, let urlResponse):
        
        guard let googleBooksList = GoogleBooksList(json: object) else {

          handler(GoogleBooksListResponse.error(
            urlResponse,
            GoogleBooksListService.responseDataError))

          return
        }
        
        handler(GoogleBooksListResponse.response(
          googleBooksList,
          urlResponse))

      case .error(let urlResponse, let error):
        print("Error occured\n\(error)")

        handler(GoogleBooksListResponse.error(
          urlResponse,
          error))
      }
    }

  }

}
