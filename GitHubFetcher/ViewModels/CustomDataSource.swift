//
//  CustomDataSource.swift
//  GitHubFetcher
//
//  Created by Damnjan Markovic on 28.5.22..
//

import UIKit


//CustomDataSource - makes ViewController cleaner.

class CustomDataSource<CELL : UICollectionViewCell, T>: NSObject, UICollectionViewDataSource {
    

    var models: [T]
    private let reuseIdentifier: String
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    init(models: [T], reuseIdentifier: String, collectionView: UICollectionView,
         configureCell: @escaping (CELL, T) -> ()) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.configureCell = configureCell
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath) as! CELL
        self.configureCell(cell, model)
        return cell
    }
}

