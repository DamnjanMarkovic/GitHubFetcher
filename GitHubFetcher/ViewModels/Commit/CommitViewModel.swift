//
//  CommitViewModel.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit
import Combine
    
final class CommitViewModel {

//MARK: - Properties
    var vcTitle: String?
    var commits = [Commit]()
    
//MARK: - Network Properties
    private let apiManager = APIManager()
    private var commitApiManager: CommitApiManager!
    
//MARK: - Combine Properties
    private var cancellables = Set<AnyCancellable>()
    
//MARK: - Observable properties
    let commitBoxViewModelCells: CustomListener<[CommitCellViewModel]?> = CustomListener([CommitCellViewModel]())
    let error = CustomListener("")
    
    init(repoModel: Repo) {
        self.vcTitle = repoModel.name
        commitApiManager = CommitApiManager(apiManager: apiManager)
        getCommits(repoModel: repoModel)
    }
    
//MARK: - Fetch Commits
    func getCommits(repoModel: Repo) {

        commitApiManager.getCommits(endpoint: .commits, repoModel: repoModel)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                     switch completion {
                     case .failure(let error):
                         guard let self = self else { return }
                         self.error.value = error.localizedDescription
                     case .finished: break
                     }
                 }, receiveValue: { [weak self] (commits) in
                     guard let self = self else { return }
                     for commit in commits {
                         self.commitBoxViewModelCells.value?.append(CommitCellViewModel(commit: commit))
                     }
                     self.commits = commits
        })
        .store(in: &cancellables)
    }
    
}
