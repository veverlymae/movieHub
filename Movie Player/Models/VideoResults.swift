//
//  VideoResults.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation

struct VideoResults {
    let details: [VideoKey]
    private enum CodingKeys: String, CodingKey {
        case details = "results"
    }
}

struct VideoKey: Codable {
    let key: String
}

