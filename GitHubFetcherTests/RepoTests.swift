//
//  RepoTests.swift
//  GitHubFetcherTests
//
//  Created by Damnjan Markovic on 28.5.22..
//

import XCTest
import Combine
@testable import GitHubFetcher

class RepoTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    let repoBoxViewModelCells: CustomListener<[RepoCellViewModel]?> = CustomListener([RepoCellViewModel]())
    let error = CustomListener("")
    
    func testFetchingRepos() throws {
        
        let apiManager = APIManager()
        let repoApiManager = RepoApiManager(apiManager: apiManager)

        let user = User(login: "octocat")
        let repos = try awaitPublisher(repoApiManager.getRepos(endpoint: .repos, user: user))
        XCTAssert(repos.count > 0)
    }

}
