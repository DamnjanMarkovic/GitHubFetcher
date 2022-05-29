//
//  CellViewModel.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

struct RepoCellViewModel {
    
    var repoName : String?
    var repoOpenIssuesCount: Int?
    var imageUrl: String?
    
    
//MARK: - Init 
    init(repo: Repo) {
        self.repoName = repo.name?.uppercased()
        self.repoOpenIssuesCount = repo.open_issues_count
        self.imageUrl = repo.owner?.avatar_url
    }
}

