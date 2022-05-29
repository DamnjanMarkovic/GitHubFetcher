//
//  UserTests.swift
//  GitHubFetcherTests
//
//  Created by Damnjan Markovic on 28.5.22..
//

import XCTest
import Combine
@testable import GitHubFetcher

class UserTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    let userValue: CustomListener<User?> = CustomListener(User())
    let error = CustomListener("")
    
    func testFetchingUser() throws {
        
        let apiManager = APIManager()
        let userApiManager = UserApiManager(apiManager: apiManager)
        
        self.userValue.value? = try awaitPublisher(userApiManager.getUser(endpoint: .user, userLogin: "octocat"))
            XCTAssertEqual(userValue.value?.id, 583231)
    }
}
