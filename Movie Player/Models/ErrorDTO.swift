//
//  ErrorDTO.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import ObjectMapper

class ErrorDTO: Mappable{
    var message: String  = "Something went wrong"
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        message <- map["message"]
    }
    
    func getErrorMessage() -> String{
        return message
    }
}
