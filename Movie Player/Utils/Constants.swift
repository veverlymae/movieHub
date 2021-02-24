//
//  Constants.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation

struct  Constants {
    
    struct MovieApiCred {
        static let apiKey = "8690372ae0e553b32046c8c9d7d83a3c"
        static let language = "en-US"
        static let imageBase = "http://image.tmdb.org/t/p/w780/"
    }
    
    struct ServiceError {
        static let InternalServerError = "Something went wrong!"
        static let ParsingError = "Service repsonse parsing error occured!"
    }
    
    
    struct Notification {
        static let networkError = "NetworkError"
    }
    
    struct Indentifier {
        static let movieCollectionViewCell = "MovieCollectionViewCell"
    }
}
