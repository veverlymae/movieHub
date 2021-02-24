//
//  MovieDTO.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieDTO: Mappable {
    
    public var voteCount :  Int?
    public var movieId : Int?
    public var hasVideo : Bool?
    public var voteAverage : Double?
    public var title : String?
    public var popularity : String?
    public var posterPath : String?
    public var originalLanguage : String?
    public var isAdult : Bool?
    public var overview : String?
    public var releaseDate : String?
    public var backdropPath : String?
    public var isLiked : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        voteCount <- map["vote_count"]
        movieId <- map["id"]
        hasVideo <- map["video"]
        voteAverage <- map["vote_average"]
        title <- map["title"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        originalLanguage <- map["original_language"]
        isAdult <- map["adult"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        backdropPath <- map["backdrop_path"]
    }

}
