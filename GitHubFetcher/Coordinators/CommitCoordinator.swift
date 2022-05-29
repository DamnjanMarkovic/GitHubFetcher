//
//  CommitCoordinator.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

class CommitCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    private var repoModel: Repo
    
    init(navigationController: UINavigationController, repoModel: Repo) {
        self.navigationController = navigationController
        self.repoModel = repoModel
    }
    
    func start() {
        let vc = CommitViewController.instantiate()
        vc.viewModel = CommitViewModel(repoModel: repoModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
