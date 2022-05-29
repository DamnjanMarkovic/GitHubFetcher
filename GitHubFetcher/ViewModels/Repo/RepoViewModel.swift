//
//  RepoViewModel.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit
import Combine
    
final class RepoViewModel {
    
//MARK: - Properties
    var vcTitle: String?
    var repos = [Repo]()
    
//MARK: - Network Properties
    private let apiManager = APIManager()
    private var repoApiManager: RepoApiManager!

//MARK: - Combine Properties
    private var cancellables = Set<AnyCancellable>()
    
//MARK: - Observable properties
    let repoBoxViewModelCells: CustomListener<[RepoCellViewModel]?> = CustomListener([RepoCellViewModel]())
    let error = CustomListener("")
    
    init(user: User) {
        self.vcTitle = user.name
        repoApiManager = RepoApiManager(apiManager: apiManager)
        getRepos(user: user)
    }
    
//MARK: - Fetch Repos
    func getRepos(user: User) {
        repoApiManager.getRepos(endpoint: .repos, user: user)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                     switch completion {
                     case .failure(let error):
                         guard let self = self else { return }
                         self.error.value = error.localizedDescription
                     case .finished: break
                     }
                 }, receiveValue: { [weak self] (repos) in
                     guard let self = self else { return }
                     
                     for repo in repos {
                         self.repoBoxViewModelCells.value?.append(RepoCellViewModel(repo:repo))
                     }
                     self.repos = repos
        })
        .store(in: &cancellables)
    }
    
}
