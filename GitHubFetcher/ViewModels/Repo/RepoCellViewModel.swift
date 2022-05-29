//
//  CellViewModel.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

struct RepoCellViewModel {
    
    var upperLabel : String?
    var bottomLabel: String?
    var imageUrl: String?
    
    
//MARK: - Init if RepoViewController is using cell
    init(repo: Repo) {
        self.upperLabel = repo.name?.uppercased()
        if let bottomLabelText = repo.open_issues_count {
            self.bottomLabel = "Open issues: \(bottomLabelText)"
        }
        self.imageUrl = repo.owner?.avatar_url
    }
}

