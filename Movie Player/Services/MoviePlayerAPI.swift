//
//  MoviePlayerAPI.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Moya
import Alamofire

let apiKey = "02f2306c3090583214e86def5a1725b1"

enum MoviePlayerAPI {
    case reco(id: Int)
    case topRated(page: Int)
    case newMovies(page: Int)
    case video(id: Int)
}

extension MoviePlayerAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else { fatalError() }
        return url
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
            
        case .reco,
             .topRated,
             .newMovies,
             .video:
            return nil
        default:
            return .bearer
        }
    }
    
    var path: String {
        switch self {
        case .reco:
            return ""
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .reco:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .reco(let id):
            return ["id": id]
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
        case .reco:
            return .requestPlain
        default:
            let requestParams = self.parameters ?? [:]
            debugPrint("task_parameter: \(requestParams)")
            return .requestParameters(parameters: requestParams, encoding: self.parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "Accept": "application/json"]
    }
}
