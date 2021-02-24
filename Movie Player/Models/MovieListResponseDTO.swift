//
//  MovieListResponseDTO.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieListResponseDTO: Mappable {
    
    public var page :  Int?
    public var totalResults : Int?
    public var totalPages : Int?
    public var results : [MovieDTO]?
    
    required convenience init?(map: Map) {
        self.init()
    }

    
    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }
}
