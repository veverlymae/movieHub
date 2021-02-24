//
//  MoviePlayerAPI.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Moya
import Alamofire

let apiKey = "8690372ae0e553b32046c8c9d7d83a3c"
let language = "en-US"

enum MoviePlayerAPI {
    case getPopularMovieList(request: MovieLatestList.Request)
}

extension MoviePlayerAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else { fatalError() }
        return url
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .getPopularMovieList:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .getPopularMovieList(let request):
            return "popular"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getPopularMovieList(let request):
            return request.dictionaryRepresentation
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        if method == .get {
            return URLEncoding.queryString
        }
        return JSONEncoding.default
    }
    
    var task: Task {
        switch self {
        case .getPopularMovieList(let request):
            return .requestParameters(parameters: request.dictionaryRepresentation, encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
