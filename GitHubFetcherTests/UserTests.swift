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
        
        self.userValue.value? = try awaitPublisher(userApiManager.getUser(endpoint: .baseURL, userLogin: "octocat"))
            XCTAssertEqual(userValue.value?.id, 583231)
    }
    
    
    
//    func testFetchingUser() {
//
//        //Adding expectation
//        let expectation = self.expectation(description: "UserFetching")
//
//        let apiManager = APIManager()
//        let userApiManager = UserApiManager(apiManager: apiManager)
//
//        // Setting up our Combine pipeline:
//        userApiManager.getUser(endpoint: .baseURL, userLogin: "octocat")
//            .eraseToAnyPublisher()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] completion in
//                     switch completion {
//                     case .failure(let error):
//                         guard let self = self else { return }
//                         self.error.value = error.localizedDescription
//                     case .finished: break
//                     }
//
//                    expectation.fulfill()
//                 }, receiveValue: { [weak self] (user) in
//                     guard let self = self else { return }
//                     print(user)
//                     self.userValue.value? = user
//
//            })
//            .store(in: &cancellables)
//
//        //Waiting for the result
//        waitForExpectations(timeout: 10)
//
//        XCTAssertEqual(userValue.value?.id, 583231)
//    }
    


}
