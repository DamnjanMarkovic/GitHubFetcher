//
//  ViewController.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit

class UserViewController: UIViewController, CustomStoryboard {

//MARK: - Properties
    @IBOutlet var imageView: UIImageView!
    var userNameLabel:CustomLabel = {
                let label = CustomLabel(frame: CGRect(x:0, y: UIScreen.main.bounds.height/3, width: UIScreen.main.bounds.width-10 , height: 100))
                return label
            }()
    var userCompanyLabel:CustomLabel = {
                let label = CustomLabel(frame: CGRect(x:0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width-10 , height: 100))
                return label
            }()

//MARK: - ViewModel
    var viewModel = UserViewModel()
    
//MARK: - Coordinator
    weak var coordinator: MainCoordinator?
    
//MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
        setUI()
        title = viewModel.vcTitle?.uppercased()
    }
    
//MARK: - Binding
    func setBinding() {
        viewModel.userValue.bind { [weak self] user in
            guard let self = self else { return }
            
            if let userImage = user?.avatar_url, !userImage.isEmpty { self.imageView.loadImageUsingCache(withUrl: userImage) }
            if let userName = user?.name, !userName.isEmpty { self.userNameLabel.text = "User name: \(userName.capitalized)" }
            if let userCompany = user?.company, !userCompany.isEmpty { self.userCompanyLabel.text = "Company: \(userCompany.capitalized)" }
        }
    }
    
//MARK: - UI Settings
    func setUI() {
        imageView.layer.cornerRadius = imageView.frame.height / 3
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        view.addSubview(self.userNameLabel)
        view.addSubview(self.userCompanyLabel)
    }
    
//MARK: - On Image Clicked Action
    @IBAction func clickImageAction(_ sender: Any) {
        if let user = viewModel.userValue.value {
            coordinator?.navigateToRepo(user: user)
        }
    }
}

