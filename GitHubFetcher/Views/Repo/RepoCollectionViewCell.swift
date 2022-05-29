//
//  ReposCollectionViewCell.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

class RepoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelDown: CustomLabel!
    @IBOutlet var labelUp: CustomLabel!
    
    static let identifier = "RepoCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI(){

        labelUp.adjustsFontSizeToFitWidth = true
        labelUp.minimumScaleFactor = 5
        labelUp.numberOfLines = 0
        labelUp.padding = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        
        labelDown.adjustsFontSizeToFitWidth = true
        labelDown.minimumScaleFactor = 5
        labelDown.padding = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
    func configure(with viewModel: RepoCellViewModel) {
        labelUp.text = viewModel.upperLabel
        labelDown.text = viewModel.bottomLabel
        
        if let imageURL = viewModel.imageUrl {
            imageView.loadImageUsingCache(withUrl: imageURL)
        }


    }

}
