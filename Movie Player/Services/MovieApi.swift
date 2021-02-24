//
//  MovieApi.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/24/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

class MovieApi {
    
    static func getPopularMovieList(request: MovieLatestList.Request,
                                   success successCallback: ((MovieListResponseDTO) -> Void)?,
                                   error errorCallback: ((ErrorDTO) -> Void)? = nil,
                                   failure failureCallback: (() -> Void)? = nil) {
        
        if request.page == -1 {
            getPopularMovieListMock(request:request, success: successCallback , error: errorCallback, failure:failureCallback)
            return
        }
        
        NetworkAdapter.request(target: MultiTarget(MoviePlayerAPI.getPopularMovieList(request: request)), success: { (response) in
            do {
                let json = try JSONSerialization.jsonObject(with: response.data(using: .utf8)!, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let movieListResponse = Mapper<MovieListResponseDTO>().map(JSONObject: json) {
                    movieListResponse.results?.reverse()
                    successCallback?(movieListResponse)
                } else {
                    failureCallback?()
                }
            }
            catch {
                failureCallback!()
            }
        }, error: { (error) in
    
        }) { (error) in
            failureCallback?()
        }
    }
    
    static func getPopularMovieListMock(request:  MovieLatestList.Request,
                                    success successCallback: ((MovieListResponseDTO) -> Void)?,
                                    error errorCallback: ((ErrorDTO) -> Void)? = nil,
                                    failure failureCallback: (() -> Void)? = nil) {
        
                let jsonURL = Bundle.main.url(forResource: "MovieData", withExtension: "json")!
                do {
                    let movieListResponseContent = try Data(contentsOf: jsonURL)
                    let json = try JSONSerialization.jsonObject(with: movieListResponseContent, options: JSONSerialization.ReadingOptions.mutableContainers)
        
                    if let movieListResponse = Mapper<MovieListResponseDTO>().map(JSONObject: json) {
                        successCallback?(movieListResponse)
                    } else {
                        failureCallback?()
                    }
                }
                catch {
                    failureCallback?()
                }
        }
}
