//
//  UserApiManager.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit
import Combine

struct UserApiManager {
    
    private let apiManager: APIService
    
    init(apiManager: APIService) {
        self.apiManager = apiManager
    }
    
    //https://api.github.com/users/octocat
    
    func getUser(endpoint: Endpoint, userLogin: String) -> AnyPublisher<User, CustomError> {

        guard let url = URL(string: "\(endpoint.urlString)\(userLogin)")
            else { preconditionFailure("Bad URL") }
        
        let urlRequest = NetworkHelpers.request(for: url, method: .GET)
        return apiManager.getData(for: urlRequest)
    }

}
