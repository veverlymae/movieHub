//
//  HomeTrailerView.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit

class HomeTrailerView: UIView {

    lazy var latestTrailerLabel: UILabel = UILabel()
    lazy var trailerCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setupLatestTrailerLabel()
        setupTrailerCollectionView()
    }
    
    private func setupLatestTrailerLabel() {
        latestTrailerLabel.text = "Latest Trailer"
        latestTrailerLabel.textColor = .white
        latestTrailerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        addSubview(latestTrailerLabel)
        latestTrailerLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func setupTrailerCollectionView() {
        addSubview(trailerCollectionView)
        trailerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(latestTrailerLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
