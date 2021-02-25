//
//  HomePopularView.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit

class HomePopularView: UIView {

    lazy var popularLabel: UILabel = UILabel()
    lazy var popularCollectionView: UICollectionView = {
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
        setupLatestTrailerLabel()
        setupTrailerCollectionView()
    }
    
    private func setupLatestTrailerLabel() {
        popularLabel.text = "Popular"
        popularLabel.textColor = .white
        popularLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        addSubview(popularLabel)
        popularLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func setupTrailerCollectionView() {
        popularCollectionView.showsHorizontalScrollIndicator = false
        popularCollectionView.showsVerticalScrollIndicator = false
        addSubview(popularCollectionView)
        popularCollectionView.snp.makeConstraints { make in
            make.top.equalTo(popularLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
