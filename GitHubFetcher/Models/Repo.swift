//
//  Repo.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import Foundation

public struct Repo: Codable {
    
    var open_issues_count : Int?
    var id : Int?
    var name : String?
    var owner: User?

}

