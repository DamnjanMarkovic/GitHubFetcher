//
//  UserViewModel.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit
import Combine
    
final class UserViewModel {

//MARK: - Properties
    var vcTitle: String?
    var user: User?
    
//MARK: - Network Properties
    private let apiManager = APIManager()
    private var userApiManager: UserApiManager!
    
//MARK: - Combine Properties
    private var cancellables = Set<AnyCancellable>()

//MARK: - Observable properties
    let userValue: CustomListener<User?> = CustomListener(User())
    let error = CustomListener("")
    
    init() {
        userApiManager = UserApiManager(apiManager: apiManager)
        getUserDetails(userLogin: Constants.USERLOGIN)
    }
    
//MARK: - Fetch User Details
    func getUserDetails(userLogin: String) {

        userApiManager.getUser(endpoint: .user, userLogin: userLogin)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                     switch completion {
                     case .failure(let error):
                         guard let self = self else { return }
                         self.error.value = error.localizedDescription
                     case .finished: break
                     }
                 }, receiveValue: { [weak self] (user) in
                     guard let self = self else { return }
                     self.userValue.value? = user

            })
            .store(in: &cancellables)
    }
}

