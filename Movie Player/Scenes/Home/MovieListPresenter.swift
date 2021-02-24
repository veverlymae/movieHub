//
//  MovieListPresenter.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation

protocol MovieListPresentationLogic {
    func presentMovieList(_ response: MovieLatestList.Response)
}

class MovieListPresenter: MovieListPresentationLogic{
    
    weak var viewController: MovieListDisplayLogic?
    
    func presentMovieList(_ response: MovieLatestList.Response) {
        viewController?.displayMovieList(response.getViewModel())
    }
}
