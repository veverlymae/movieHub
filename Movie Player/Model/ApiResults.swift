//
//  ApiResults.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation

struct ApiResults {
    let page: Int
    let numResults: Int
    let numPages: Int
    let movies: [Movie]
}

extension ApiResults: Codable {
    enum CodingKeys: String, CodingKey {
        case page,
        numResults = "total_results",
        numPages = "total_pages",
        movies = "results"
    }
    
}
