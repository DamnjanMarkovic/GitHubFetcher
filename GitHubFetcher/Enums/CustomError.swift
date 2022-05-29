//
//  CustomError.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import Foundation

public enum CustomError: Error {
    
    case urlError(error: URLError)
    case parsingError
    case other(error: Error)
}
