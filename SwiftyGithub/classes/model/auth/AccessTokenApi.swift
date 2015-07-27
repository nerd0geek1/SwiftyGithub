//
//  AccessTokenApi.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/27/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import Alamofire
import Foundation

class AccessTokenApi {
    
    func fetchAccessTokenWithCode(code: String, completionBlock:(NSError? -> Void)?) {
        
        let path = String(format: "https://github.com/login/oauth/access_token")
        let param = [
            "client_id" : AuthService.clientId,
            "client_secret" : AuthService.clientSecret,
            "code" : code,
        ]
        let headers = ["Accept" : "application/json"]
        
        Alamofire.request(.POST, path, parameters: param, headers: headers)
        .responseJSON() { (request, response, json, error) -> Void in
            if let error = error {
                completionBlock?(error)
                return
            }
            if let json = json as? [String : AnyObject] {
                if let accessToken = json["access_token"] as? String {
                    AccessTokenRepository().saveToken(accessToken, completionBlock: { (error) -> Void in
                        completionBlock?(error)
                    })
                }
            }
        }
    }
}