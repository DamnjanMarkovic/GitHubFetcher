//
//  CustomListener.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import Foundation


//Helps establishing decoupled connection between ViewController and ViewModel.

final class CustomListener<T> {
    
      typealias Listener = (T) -> Void
      var listener: Listener?
      var value: T {
            didSet {
                listener?(value)
            }
      }
        
      init(_ value: T) {
          self.value = value
      }
        
      func bind(listener: Listener?) {
            self.listener = listener
            listener?(value)
      }
}
