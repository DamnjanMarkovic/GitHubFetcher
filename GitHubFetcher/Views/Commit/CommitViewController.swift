//
//  CommitViewController.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

class CommitViewController: UIViewController, CustomStoryboard {
    
//MARK: - CollectionViews
    private var dataSourceRepo:CustomDataSource<CommitCollectionViewCell, CommitCellViewModel>?
    @IBOutlet var collectionView: UICollectionView!

//MARK: - Coordinator
    weak var coordinator: CommitCoordinator?
    
//MARK: - ViewModel
    var viewModel: CommitViewModel?

//MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.vcTitle?.uppercased()
        setBinding()
    }
    
//MARK: - CollectionViewCells Rendering
    func renderCollectionViewDataSource(_ cellViewModels: [CommitCellViewModel]){
        
        dataSourceRepo = CustomDataSource(models: cellViewModels as [CommitCellViewModel],
                 reuseIdentifier: CommitCollectionViewCell.identifier, collectionView: collectionView, configureCell: { (cell, commitCellViewModel) in
                        cell.configure(with: commitCellViewModel)
        })
        collectionView.delegate = self
        collectionView.dataSource = dataSourceRepo
    }
    
//MARK: - Binding
    func setBinding() {
        viewModel?.commitBoxViewModelCells.bind { [weak self] viewData in
            self?.renderCollectionViewDataSource(viewData ?? [])
        }
    }
}
//MARK: - FlowLayout
extension CommitViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)

    }
}

