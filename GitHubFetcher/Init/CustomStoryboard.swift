//
//  CustomStoryboard.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 26.5.22..
//

import UIKit

protocol CustomStoryboard {
    static func instantiate() -> Self
}

extension CustomStoryboard where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let customStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return customStoryBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}



