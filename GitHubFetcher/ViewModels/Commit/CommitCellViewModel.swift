//
//  CommitCellViewModel.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 29.5.22..
//
import UIKit

struct CommitCellViewModel {
    
    var message : String?
    var isVerified: Bool?
    var imageUrl: String?
    
    
//MARK: - Init if CommitViewController is using cell
    init(commit: Commit) {
        self.message = commit.commit?.message
        self.isVerified = commit.commit?.verification?.verified ?? false
        self.imageUrl = commit.committer?.avatar_url
    }

}
