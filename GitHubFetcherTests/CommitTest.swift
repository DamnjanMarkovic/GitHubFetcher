//
//  CommitTest.swift
//  GitHubFetcherTests
//
//  Created by Damnjan Markovic on 28.5.22..
//

import XCTest
import Combine
@testable import GitHubFetcher

class CommitTest: XCTestCase {

    private var cancellables = Set<AnyCancellable>()
    private var dataSourceRepo:CustomDataSource<RepoCollectionViewCell, RepoCellViewModel>?
    
    let error = CustomListener("")
    
    
    func testFetchingCommits() throws {
        
        let apiManager = APIManager()
        let commitApiManager = CommitApiManager(apiManager: apiManager)

        let owner = User(login: "octocat")
        let repoModel = Repo(name: "boysenberry-repo-1", owner: owner)
        let commits = try awaitPublisher(commitApiManager.getCommits(endpoint: .baseURL, repoModel: repoModel))
        XCTAssert(commits.count > 0)
    }

}
