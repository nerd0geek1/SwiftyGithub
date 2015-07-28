//
//  Repository.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/28/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import ObjectMapper

class RepositoryList: Mappable {
    
    private(set) var repositoryList: [Repository]? = nil
    
    class func newInstance() -> Mappable {
        return RepositoryList()
    }
    
    func mapping(map: Map) {
        repositoryList <- map["items"]
    }
}

class Repository: Mappable {
    
    private(set) var id = NSNotFound
    private(set) var name = ""
    private(set) var fullname = ""
//    private(set) var owner: user?
    private(set) var isPrivate = false
    private(set) var htmlURL: NSURL! = nil
    private(set) var description = ""
    private(set) var isForked = false
    private(set) var url: NSURL! = nil
    private(set) var createdAt = ""
    private(set) var updatedAt = ""
    private(set) var pushedAt = ""
    private(set) var homePage: NSURL! = nil
    private(set) var size = 0
    private(set) var startGazerCount = 0
    private(set) var watcherCount = 0
    private(set) var language = ""
    private(set) var forksCount = 0
    private(set) var openIssueCount = 0
    private(set) var masterBranch = ""
    private(set) var defaultBranch = ""
    private(set) var score = 0.0
    
    class func newInstance() -> Mappable {
        return Repository()
    }
    
    func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        fullname        <- map["full_name"]
//        owner: user?
        isPrivate       <- map["private"]
        htmlURL         <- (map["html_url"], URLTransform())
        description     <- map["description"]
        isForked        <- map["fork"]
        url             <- (map["url"], URLTransform())
        createdAt       <- map["created_at"]
        updatedAt       <- map["updated_at"]
        pushedAt        <- map["pushed_at"]
        homePage        <- (map["homepage"], URLTransform())
        size            <- map["size"]
        startGazerCount <- map["stargazers_count"]
        watcherCount    <- map["watchers_count"]
        language        <- map["language"]
        forksCount      <- map["forks_count"]
        openIssueCount  <- map["open_issues_count"]
        masterBranch    <- map["master_branch"]
        defaultBranch   <- map["default_branch"]
        score           <- map["score"]
    }
}