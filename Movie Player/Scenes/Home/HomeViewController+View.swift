//
//  HomeViewController+View.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController {
    
    func setupScene() {
        setupHomeHeaderView()
        setupScrollView()
        setupHomeSubHeaderView()
        setupTrailerView()
        setupTrendingView()
    }
    
    private func setupHomeHeaderView() {
        view.addSubview(homeHeaderView)
        homeHeaderView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(homeHeaderView.snp.bottom).inset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaInsets.bottom)
        }
    }
    
    private func setupHomeSubHeaderView() {
        scrollView.addSubview(homeSubHeaderView)
        homeSubHeaderView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.right.equalTo(view.snp.right)
        }
    }
    
    private func setupTrailerView() {
        scrollView.addSubview(homePopularView)
        homePopularView.snp.makeConstraints { make in
            make.top.equalTo(homeSubHeaderView.snp.bottom)
            make.left.right.equalTo(homeSubHeaderView)
             make.height.equalTo(250)
        }
    }
    
    private func setupTrendingView() {
        scrollView.addSubview(homeTrendingView)
        homeTrendingView.snp.makeConstraints { make in
            make.top.equalTo(homePopularView.snp.bottom)
            make.left.right.equalTo(homePopularView)
        }
    }
}
