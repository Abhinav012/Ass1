//
//  MyGithubModel.swift
//  Assignment1
//
//  Created by Thanos on 11/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation

struct MyGitHub: Codable{
    var login: String?
    var id: Int?
    var nodeId: String?
    var avatarUrl: String?
    var gravatarId: String?
    var url: String?
    var htmlUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistsUrl: String?
    var starredUrl: String?
    var subscriptionsUrl: String?
    var organizationsUrl: String?
    var reposUrl: String?
    var eventsUrl: String?
    var receivedEventsUrl : String?
    var type: String?
    var siteAdmin: String?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: String?
    var bio: String?
    var publicRepos: Int?
    var publicGist: Int?
    var followers: Int?
    var following: Int?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey{
        case login = "login"
        case id = "id"
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
    }
}
