//
//  CommitApiManager.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit
import Combine

struct CommitApiManager {
    
    private let apiManager: APIService
    
    init(apiManager: APIService) {
        self.apiManager = apiManager
    }
    
    //https://api.github.com/repos/octocat/boysenberry-repo-1/commits
    
    func getCommits(endpoint: Endpoint, repoModel: Repo) -> AnyPublisher<[Commit], CustomError> {
        
        guard let repoOwner = repoModel.owner, let repoOwnerLogin = repoOwner.login, let repoName = repoModel.name,
                let url = URL(string: "\(endpoint.urlString)\(repoOwnerLogin)/\(repoName)/commits")
            else { preconditionFailure("Bad URL") }
        
        let urlRequest = NetworkHelpers.request(for: url, method: .GET)
        return apiManager.getData(for: urlRequest)
        

    }

}
