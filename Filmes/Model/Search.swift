//
//  Search.swift
//  Filmes
//
//  Created by Gabriel Bianchini on 29/09/20.
//  Copyright © 2020 Gabriel Bianchini. All rights reserved.
//

import Foundation

struct Search: Codable {
    
    var filmes: [Filme]
    var response: String
    
    enum CodingKeys: String, CodingKey {
        case filmes = "Search"
        case  response = "Response"
    }
}
