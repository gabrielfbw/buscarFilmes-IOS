//
//  ViewController.swift
//  Filmes
//
//  Created by Gabriel Bianchini on 17/09/20.
//  Copyright © 2020 Gabriel Bianchini. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var nomeFilmeTextField: UITextField!
    var filmes : [Filme] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buscarFilme(_ sender: Any) {
        if let nomeFilme  = nomeFilmeTextField.text{
            Requests.searchFilmes(nomeFilme: nomeFilme) { (search, erro) in
                if let searchFlatten = search {
                    self.filmes = searchFlatten.filmes
                    self.tableView.reloadData()
                    self.view.endEditing(true)
                } else {
                    //print(erro as Any)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalheFilme" {
            if let indexPath = tableView.indexPathForSelectedRow  {
                let filmeSelecionado = self.filmes[indexPath.row]
                let viewControllerDestino = segue.destination as! DetalhesFilmeViewController
                viewControllerDestino.imdbID = filmeSelecionado.imdbID
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let filme : Filme = filmes[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula
        
        let isEqual = (filme.poster == "N/A")
        if isEqual {
            celula.ImageViewFilme.image = #imageLiteral(resourceName: "imagem_indisponivel")
        }else{
            let myImageUrl = NSURL(string: filme.poster)
            let imageData = NSData(contentsOf: myImageUrl! as URL )
            celula.ImageViewFilme.image = UIImage(data: imageData! as Data)
        }
        
        celula.LabelTilte.text = filme.title
        celula.LabelDescricao.text = filme.year
        celula.ImageViewFilme.layer.cornerRadius = 20
        celula.ImageViewFilme.clipsToBounds = true
        
        return celula        
    }
    
}

