//
//  Genre.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation

struct Genre {
    var id: Int
    var name: String
}

extension Genre: Codable {
    enum CodingKeys: String, CodingKey {
        case id,
        name
    }
}
