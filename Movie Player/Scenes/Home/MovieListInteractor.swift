//
//  MovieListInteractor.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation

protocol MovieListBusinessLogic {
    func getPopularMovieList(_ request: MovieLatestList.Request)
}

class MovieListInteractor: MovieListBusinessLogic{
    var presenter: MovieListPresentationLogic?
    
    func getPopularMovieList(_ request: MovieLatestList.Request) {
            MovieApi.getPopularMovieList(request: request, success: {
                    [weak weakSelf = self] (response) in
                    weakSelf?.presenter?.presentMovieList(MovieLatestList.Response(data: response))
            })
    }
}
