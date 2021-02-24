//
//  HomeViewController+CollectionView.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let movieModels = moviesResponseModel?.result else { return 0 }
        return movieModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Indentifier.movieCollectionViewCell, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.movieViewModel = self.moviesResponseModel?.result?[indexPath.row]
        return cell
    }
}
