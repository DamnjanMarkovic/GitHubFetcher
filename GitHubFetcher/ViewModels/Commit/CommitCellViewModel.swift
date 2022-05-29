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
    var imageAuthorUrl: String?
    var imageCommiterUrl: String?
    var time: String?
    
    
//MARK: - Init 
    init(commit: Commit) {
        self.message = commit.commit?.message
        self.isVerified = commit.commit?.verification?.verified ?? false
        
        //"2016-08-02T19:06:17Z"
        if let timeArrived = commit.commit?.author?.date {
            self.time = String(timeArrived.replacingOccurrences(of: "T", with: "    ").dropLast())
        }
        
        self.imageAuthorUrl = commit.author?.avatar_url
        
        //If commiter is different from author, set the iamgeURL form commiter, else not.
        self.imageCommiterUrl = commit.committer?.login != commit.author?.login ? commit.committer?.avatar_url : nil
    }

}
