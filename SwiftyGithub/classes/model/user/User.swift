//
//  User.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/28/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    
    private(set) var login = ""
    private(set) var id = NSNotFound
    private(set) var avatarURL: NSURL! = nil
    private(set) var gravatarId = NSNotFound
    private(set) var url: NSURL! = nil
    private(set) var htmlURL: NSURL? = nil
    private(set) var followersURL: NSURL? = nil
    private(set) var followingURL: NSURL? = nil
    private(set) var gistsURL: NSURL? = nil
    private(set) var starredURL: NSURL? = nil
    private(set) var subscriptionsURL: NSURL? = nil
    private(set) var organizationsURL: NSURL? = nil
    private(set) var reposURL: NSURL? = nil
    private(set) var eventsURL: NSURL? = nil
    private(set) var receivedEventsURL: NSURL! = nil
    private(set) var type = ""
    private(set) var siteAdmin = false
    private(set) var name = ""
    private(set) var company = ""
    private(set) var blog = ""
    private(set) var location = ""
    private(set) var email = ""
    private(set) var hireable = false
    private(set) var bio = ""
    private(set) var publicRepos = 0
    private(set) var publicGist = 0
    private(set) var followers = 0
    private(set) var following = 0
    private(set) var createdAt = ""
    private(set) var updatedAt = ""

    class func newInstance() -> Mappable {
        return User()
    }
    
    func mapping(map: Map) {
        login               <- map["login"]
        id                  <- map["id"]
        avatarURL           <- (map["avatar_url"], URLTransform())
        gravatarId          <- map["gravatar_id"]
        url                 <- (map["url"], URLTransform())
        htmlURL             <- (map["html_url"], URLTransform())
        followersURL        <- (map["followers_url"], URLTransform())
        followingURL        <- (map["following_url"], URLTransform())
        gistsURL            <- (map["gists_url"], URLTransform())
        starredURL          <- (map["starred_url"], URLTransform())
        subscriptionsURL    <- (map["subscriptions_url"], URLTransform())
        organizationsURL    <- (map["organizations_url"], URLTransform())
        reposURL            <- (map["repos_url"], URLTransform())
        eventsURL           <- (map["events_url"], URLTransform())
        receivedEventsURL   <- (map["received_events_url"], URLTransform())
        type                <- map["type"]
        siteAdmin           <- map["site_admin"]
        name                <- map["name"]
        company             <- map["company"]
        blog                <- map["blog"]
        location            <- map["location"]
        email               <- map["email"]
        hireable            <- map["hireable"]
        bio                 <- map["bio"]
        publicRepos         <- map["public_repos"]
        publicGist          <- map["public_gists"]
        followers           <- map["followers"]
        following           <- map["following"]
        createdAt           <- map["created_at"]
        updatedAt           <- map["updated_at"]
    }
}