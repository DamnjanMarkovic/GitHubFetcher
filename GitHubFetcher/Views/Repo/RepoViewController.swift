//
//  ReposViewController.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

class RepoViewController: UIViewController, CustomStoryboard, UICollectionViewDelegate {
    
//MARK: - CollectionViews
    private var dataSourceRepo:CustomDataSource<RepoCollectionViewCell, RepoCellViewModel>?
    @IBOutlet var collectionView: UICollectionView!

//MARK: - Coordinator
    weak var coordinator: RepoCoordinator?
    
//MARK: - ViewModel
    var viewModel: RepoViewModel?

//MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.vcTitle?.uppercased()
        setBinding()
    }
        
//MARK: - CollectionViewCells Rendering
    func renderCollectionViewDataSource(_ cellViewModels: [RepoCellViewModel]){
        dataSourceRepo = CustomDataSource(models: cellViewModels as [RepoCellViewModel],
                 reuseIdentifier: RepoCollectionViewCell.identifier, collectionView: collectionView, configureCell: { (cell, repoCellViewModel) in
                        cell.configure(with: repoCellViewModel)
        })
        
        collectionView.dataSource = dataSourceRepo
        collectionView.delegate = self
    }
    
//MARK: - Binding
    func setBinding() {
        viewModel?.repoBoxViewModelCells.bind { [weak self] viewData in
            self?.renderCollectionViewDataSource(viewData ?? [])
        }
    }

//MARK: - OnSelect Action
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.navigateToCommit(repoModel: (viewModel?.repos[indexPath.row])!)
    }
}


