//
//  DetalhesFilmeController.swift
//  Filmes
//
//  Created by Gabriel Bianchini  on 29/09/20.
//  Copyright © 2020 Gabriel Bianchini. All rights reserved.
//

import UIKit
import Foundation

class DetalhesFilmeViewController: UITableViewController {
    
    var detalhe: DetalhesFilme?
    var imdbID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Requests.searchDetails(imdbID: imdbID) { (detalhe, error) in
            if let detalheFlatten = detalhe {
                self.detalhe = detalheFlatten
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } else {
                print(error as Any)
            }
        }
    }
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if detalhe == nil{
            return 0
        }else{
            return 2
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let celula = tableView.dequeueReusableCell(withIdentifier: "ImagemFilmeCelula", for: indexPath) as! ImagemFilmeCelula
            
            let isEqual = (detalhe?.poster == "N/A")
            if isEqual {
                celula.filmeImage.image = #imageLiteral(resourceName: "imagem_indisponivel")
            }else{
                let myImageUrl = NSURL(string: detalhe!.poster)!
                let imageData = NSData(contentsOf: myImageUrl as URL )
                celula.filmeImage.image = UIImage(data: imageData! as Data)
            }
            
            return celula
        } else {
            let celula = tableView.dequeueReusableCell(withIdentifier: "DetalhesCelula", for: indexPath) as! DetalhesCelula
            
            celula.titleLabel.text = detalhe?.title
            celula.duracaoLabel.text = detalhe?.runtime
            celula.anoLabel.text = detalhe?.year
            celula.generoLabel.text = detalhe?.genre
            celula.diretorLabel.text = detalhe?.director
            celula.atoresLabel.text = detalhe?.actors
            celula.escritorLabel.text = detalhe?.writer
            celula.linguagemLabel.text = detalhe?.language
            celula.paisLabel.text = detalhe?.country
            celula.premiosLabel.text = detalhe?.awards
            
            return celula
            
        }
        
    }
    
    
}


