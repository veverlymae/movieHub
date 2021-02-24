//
//  HomeViewController.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/20/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit

protocol MovieListDisplayLogic: class {
    func displayMovieList(_ viewModel: MovieLatestList.ViewModel)
}

class HomeViewController: UIViewController, MovieListDisplayLogic {

    var homeHeaderView: HomeHeaderView = HomeHeaderView()
    var scrollView: UIScrollView = UIScrollView()
    var homeSubHeaderView: HomeSubHeaderView = HomeSubHeaderView()
    var homeTrailerView: HomeTrailerView = HomeTrailerView()
    var homeTrendingView: HomeTrendingView = HomeTrendingView()
    
    var currentPage = 1
    var interactor: MovieListBusinessLogic?
    var moviesResponseModel: MovieLatestList.ViewModel.MovieResponseViewModel? {
        didSet{
            reload()
        }
    }
    
    override func loadView() {
        super.loadView()
        setupScene()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let viewController = self
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLatestCollectionView()
        fetchLatestMovies()
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
    
    func reload() {
        homeTrailerView.trailerCollectionView.reloadData()
    }
    
    func displayMovieList(_ viewModel: MovieLatestList.ViewModel) {
        currentPage = viewModel.movieView.page ?? 0
        moviesResponseModel = viewModel.movieView
    }
    
    func setupLatestCollectionView() {
        homeTrailerView.trailerCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Indentifier.movieCollectionViewCell)
        homeTrailerView.trailerCollectionView.delegate = self
        homeTrailerView.trailerCollectionView.dataSource = self
    }
    
    func fetchLatestMovies() {
        let request = MovieLatestList.Request(page: currentPage)
        interactor?.getPopularMovieList(request)
    }
}
