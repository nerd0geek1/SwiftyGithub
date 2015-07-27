//
//  AccessTokenRepository.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/27/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import Foundation
import KeychainAccess

class AccessTokenRepository {
    
    static let ACCESS_TOKEN_KEY = "token"
    let keychain = Keychain()
    
    func saveToken(accessToken: String, completionBlock: (NSError? -> Void)?) {
        if let error = keychain.set(accessToken, key: self.dynamicType.ACCESS_TOKEN_KEY) {
            completionBlock?(error)
        } else {
            completionBlock?(nil)
        }
    }
    
    func getToken() -> (token: String?, error: NSError?) {
        let failable = keychain.getStringOrError(self.dynamicType.ACCESS_TOKEN_KEY)
        return (token: failable.value, error: failable.error)
    }
}
