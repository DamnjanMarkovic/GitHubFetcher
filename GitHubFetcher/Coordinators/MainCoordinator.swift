//
//  UserCoordinator.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {

    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = UserViewController.instantiate()
        vc.coordinator = self
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToRepo(user: User) {
        
        let child = RepoCoordinator(navigationController: navigationController, user: user)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func navigateToCommit(repoModel: Repo) {
        
        let child = CommitCoordinator(navigationController: navigationController, repoModel: repoModel)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let repoController = fromViewController as? RepoViewController {
            childDidFinish(repoController.coordinator)
        }
        if let commitController = fromViewController as? CommitViewController {
            childDidFinish(commitController.coordinator)
        }
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
