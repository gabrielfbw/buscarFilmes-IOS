//
//  Rating.swift
//  Filmes
//
//  Created by Gabriel Bianchini on 29/09/20.
//  Copyright © 2020 Gabriel Bianchini. All rights reserved.
//

import Foundation

struct Ratings : Codable{
    var source : String?
    var value :String?
    
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case  value = "Value"
    }
}
