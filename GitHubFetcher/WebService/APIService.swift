//
//  APIService.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit
import Combine

protocol APIService {
    
    func getData<T: Decodable>(for urlRequest: URLRequest) -> AnyPublisher<T, CustomError>
}
