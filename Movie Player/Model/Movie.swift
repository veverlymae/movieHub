//
//  Movie.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation

struct Movie {
    let id: Int
    let posterPath: String
    let videoPath: String?
    let backdrop: String
    let title: String
    var releaseDate: String
    var rating: Double
    let overview: String
    var genres: [Genre]
    
}

extension Movie: Codable {
    enum CodingKeys: String, CodingKey {
        case id,
        posterPath = "poster_path",
        videoPath,
        backdrop = "backdrop_path",
        title,
        releaseDate = "release_date",
        rating = "vote_average",
        overview,
        genres = "genres"
    }
}

