//
//  EndPoint.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import Foundation

enum Endpoint {
    
    case baseURL
    case user
    case repos
    case commits
    
    var urlString: String {
        
        switch self {
            case .baseURL:
                return Constants.URLs.BASE
            case .user:
                return Constants.URLs.USER
            case .repos:
                return Constants.URLs.REPOS
            case .commits:
                return Constants.URLs.COMMITS
        }
    }
}

enum Method: String {
    case GET
}
