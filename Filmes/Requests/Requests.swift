//
//  Requests.swift
//  Filmes
//
//  Created by Ítalo Bianchini on 01/10/20.
//  Copyright © 2020 Gabriel Bianchini. All rights reserved.
//

import Foundation

class Requests {
    
    static func searchDetails(imdbID: String, completion:  @escaping (_ detalhe: DetalhesFilme?, _ error: Error?) -> Void) {
        let url = URL(string: "https://www.omdbapi.com/?apikey=d81547e1&i=" + imdbID)!
        let task = URLSession.shared.dataTask(with: url) {(dados, response, error) in
            DispatchQueue.main.async { 
                if let dados = dados {
                    let detalhes = try?  JSONDecoder().decode(DetalhesFilme.self, from:dados)
                    completion(detalhes, error)
                } else {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    static func searchFilmes(nomeFilme: String, completion:  @escaping (_ search: Search?, _ error: Error?) -> Void){
        let url = URL(string: "https://www.omdbapi.com/?apikey=d81547e1&s=" + nomeFilme)!
        let task = URLSession.shared.dataTask(with: url) {(dados, response, error) in
            DispatchQueue.main.async {
                if let dados = dados{
                            let search = try?  JSONDecoder().decode(Search.self, from:dados)
                             completion(search, error)
//                         
                }else{
                            completion(nil, error)
                        }
                    }
                }
    
        task.resume()
    }
}
