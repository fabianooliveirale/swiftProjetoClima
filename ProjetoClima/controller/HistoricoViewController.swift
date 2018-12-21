//
//  ClimaTableViewController.swift
//  ProjetoClima
//
//  Created by Anderson Soares on 14/12/18.
//  Copyright © 2018 exemplos. All rights reserved.
//

import UIKit
import SVProgressHUD

class HistoricoViewController: UITableViewController {
    
 
    var climas: [ClimaJson] = []
    var clima: ClimaJson!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController!.navigationBar.tintColor = UIColor.white;
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "historico" {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let selected = climas[indexPath.row]
                     let vcDestino = segue.destination as! ClimaViewController
                     vcDestino.clima = selected
                }
            }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clima = climas[indexPath.row]
        
        print(clima.results.cityName)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let dao = HistoricoDao()
            dao.remove(index: indexPath.row)
            refresh()
        }
        
    }
    
    func refresh(){
        let dao = HistoricoDao()
        
        climas = dao.listar()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refresh()
    }
    
 


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return climas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let c: ClimaJson = climas [indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHistorco", for: indexPath) as! cellHistorico// indentificado de CEL na main story boad
        if let clima:ClimaJson = c {
            print(clima.results.cityName + "AKI AKI AKI ERRO!")
            cell.nameCell.text = clima.results.cityName
            cell.dataCell.text = clima.results.date
        }
        return cell
    }

}


class cellHistorico: UITableViewCell {
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var dataCell: UILabel!
    
    
}
