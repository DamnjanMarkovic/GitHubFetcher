//
//  RepoCoordinator.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

class RepoCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    private var user: User
    
    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let vc = RepoViewController.instantiate()
        vc.viewModel = RepoViewModel(user: user)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToCommit(repoModel: Repo) {
        parentCoordinator?.navigateToCommit(repoModel: repoModel)
    }
    
}
