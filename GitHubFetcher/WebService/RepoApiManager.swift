//
//  RepoApiManager.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit
import Combine

struct RepoApiManager {
    
    private let apiManager: APIService
    
    init(apiManager: APIService) {
        self.apiManager = apiManager
    }

    //https://api.github.com/users/octocat/repos
    
    func getRepos(endpoint: Endpoint, user: User) -> AnyPublisher<[Repo], CustomError> {
        
        guard let userLogin = user.login, let url = URL(string: "\(endpoint.urlString)\(userLogin)/repos")
            else { preconditionFailure("Bad URL") }
        
        let urlRequest = NetworkHelpers.request(for: url, method: .GET)
        return apiManager.getData(for: urlRequest)
    }

}

