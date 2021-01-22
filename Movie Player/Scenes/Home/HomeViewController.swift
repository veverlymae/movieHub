//
//  HomeViewController.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/20/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Contacts
import SwiftEntryKit
import CocoaLumberjack

class HomeViewController: UIViewController {
   
    var homeHeaderView: HomeHeaderView = HomeHeaderView()
    var scrollView: UIScrollView = UIScrollView()
    var homeSubHeaderView: HomeSubHeaderView = HomeSubHeaderView()
    var homeTrailerView: HomeTrailerView = HomeTrailerView()
    var homeTrendingView: HomeTrendingView = HomeTrendingView()
    
    override func loadView() {
        super.loadView()
        setupScene()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeTrailerView.trailerCollectionView.delegate = self
        homeTrailerView.trailerCollectionView.dataSource = self
        homeTrendingView.trendingCollectionView.delegate = self
        homeTrendingView.trendingCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
