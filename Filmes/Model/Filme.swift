//
//  Filme.swift
//  Filmes
//
//  Created by Gabriel Bianchini on 17/09/20.
//  Copyright © 2020 Gabriel Bianchini. All rights reserved.
//

import Foundation

struct  Filme : Codable {
    
    var title: String
    var year: String
    var imdbID : String
    var type: String
    var poster : String
    
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case  year = "Year"
        case  imdbID
        case  type = "Type"
        case  poster = "Poster"
    }
    
}

