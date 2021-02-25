//
//  HomeTrendingView.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit

class HomeTrendingView: UIView {

    lazy var trendingLabel: UILabel = UILabel()
    lazy var trendingCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         layout.itemSize = CGSize(width: 100, height: 200)
         layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setupTrendingLabel()
        setupTrendingCollectionView()
    }
    
    private func setupTrendingLabel() {
        trendingLabel.text = "Trending"
        trendingLabel.textColor = .white
        trendingLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        addSubview(trendingLabel)
        trendingLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func setupTrendingCollectionView() {
        addSubview(trendingCollectionView)
        trendingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(trendingLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
    }

}
