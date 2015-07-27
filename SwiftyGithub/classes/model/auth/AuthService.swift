//
//  AuthService.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/27/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import Foundation

class AuthService {
    static let sharedService = AuthService()
    static let clientId = ""
    static let clientSecret = ""
    
    func isSignedIn() -> Bool {
        if let token = AccessTokenRepository().getToken().token {
            return true
        }
        return false
    }
    
    func signOut() {
        //TODO: implement logic
    }
    
    func signInWithCode(code: String, completionBlock: (NSError? -> Void)?) {
        AccessTokenApi().fetchAccessTokenWithCode(code, completionBlock: { (error) -> Void in
            completionBlock?(error)
        })
    }
    
    func getToken() -> String? {
        if let token = AccessTokenRepository().getToken().token {
            return token
        }
        return nil
    }
}