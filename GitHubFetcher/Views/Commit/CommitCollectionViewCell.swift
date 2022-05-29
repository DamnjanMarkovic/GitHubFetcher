//
//  CommitCollectionViewCell.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 29.5.22..
//

import UIKit

class CommitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageCommiterView: UIImageView!
    @IBOutlet var imageAuthorView: UIImageView!
    @IBOutlet var labelTime: UILabel!
    @IBOutlet var labelVerified: UILabel!
    @IBOutlet var labelMessage: UILabel!
    @IBOutlet var labelCommiter: UILabel!
    
    static let identifier = "CommitCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI(){

        labelVerified.adjustsFontSizeToFitWidth = true
        labelVerified.minimumScaleFactor = 5
        labelVerified.numberOfLines = 0
        labelVerified.padding = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        
        labelTime.adjustsFontSizeToFitWidth = true
        labelTime.minimumScaleFactor = 5
        labelTime.padding = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        
        labelMessage.adjustsFontSizeToFitWidth = true
        labelMessage.minimumScaleFactor = 5
        labelMessage.padding = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        
        imageAuthorView.layer.cornerRadius = imageAuthorView.frame.height / 2
        imageAuthorView.layer.masksToBounds = true
        imageAuthorView.contentMode = .scaleAspectFit
        imageAuthorView.clipsToBounds = true
        
        imageCommiterView.layer.cornerRadius = imageCommiterView.frame.height / 2
        imageCommiterView.layer.masksToBounds = true
        imageCommiterView.contentMode = .scaleAspectFit
        imageCommiterView.clipsToBounds = true
    }
    
    func configure(with viewModel: CommitCellViewModel) {
        labelTime.text = viewModel.time
        labelMessage.text = viewModel.message
        labelVerified.text = viewModel.isVerified! ? "VERIFIED" : "UNVERIFIED"
        labelVerified.textColor = viewModel.isVerified! ? .systemGreen : .systemRed

        
        if let imageAuthorURL = viewModel.imageAuthorUrl {
            imageAuthorView.loadImageUsingCache(withUrl: imageAuthorURL)
        }
        if let imageCommiter = viewModel.imageCommiterUrl {
            imageCommiterView.loadImageUsingCache(withUrl: imageCommiter)
            labelCommiter.text = "Commiter:"
        }

    }

}
