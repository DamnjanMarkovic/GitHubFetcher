//
//  Commit.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

struct Commit : Codable{

    var sha : String?
    var commit: Commited?
    var author: User?
    var committer: User?
    
}

struct Commited: Codable {
    var author: User?
    var committer: User?
    var message: String?
    var verification: Verification?
}

struct Verification: Codable {
    var verified: Bool
    var reason: String?
}
