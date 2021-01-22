//
//  MovieServiceProtocol.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Moya
import ReactiveSwift

protocol MovieServiceProtocol {
    var provider: MoyaProvider<MoviePlayerAPI> { get }
    
}

extension MovieServiceProtocol {
    func request<T: Decodable>(_ typeOf: T.Type, target: MoviePlayerAPI) -> SignalProducer<T, MoyaError> {
        return provider
            .reactive
            .request(target)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(T.self)
    }
}
