//
//  RepositoryApi.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/28/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class RepositoryApi {
    
    func fetchSearchedRepositoryWithQuery(query: String, completionBlock:(NSError? -> Void)?) {
        let path = String(format: "https://api.github.com/search/repositories")
        let param = [
            "q" : query
        ]
        let headers = ["Accept" : "application/json"]

        Alamofire.request(.GET, path, parameters: param, headers: headers)
            .responseObject { (response: RepositoryList?, error: NSError?) in
                if let repositoryList = response?.repositoryList {
                    
                }
                completionBlock?(error)
        }
    }
}
