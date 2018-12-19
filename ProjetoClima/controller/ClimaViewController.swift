//
//  ClimaViewController.swift
//  ProjetoClima
//
//  Created by Anderson Soares on 15/12/18.
//  Copyright © 2018 exemplos. All rights reserved.
//

import UIKit
import SVProgressHUD

class ClimaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var img: UIImageView!
    var clima: ClimaJson!
    var woeid: String = ""
    @IBOutlet weak var utb: UITableView!
    var txtField1: UITextField!
    
    
    
    @IBAction func pesquisa(_ sender: Any) {
        
        let alert = UIAlertController(title: "woeId", message: "Coloque o woeid da cidade.", preferredStyle: .alert)
        // UIAlertControllerStyle.Alert
        
        alert.addTextField(configurationHandler: addTextField1)
        //                alert.addTextField(configurationHandler: addTextField2)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: { (UIAlertAction)in
        }))
        alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertAction.Style.default, handler:{ (UIAlertAction)in
            
            self.woeid = (self.txtField1.text!)
            if self.woeid == "" {
                self.woeid = "455822"
            }
            
            self.getClima()
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addTextField1(textField: UITextField!)
    {
        textField.placeholder = "Digite da cidade woeId"
        txtField1 = textField
    }
    
    
    
    func getClima(){
        SVProgressHUD.show()
        Api.climaDetalhes(woeid: woeid, completion: { item in
            if let c :ClimaJson = item {
                let dao: HistoricoDao = HistoricoDao()
               // dao.salvar(clima: c)
                self.clima = c
                dao.salvar(clima: c)
                
               // self.clima = dao.listar()[0]
                self.refresh()
            }
            SVProgressHUD.dismiss()
        })

        
    }
    
    func getImg(s: String) -> UIImage {
        var s2 = ""
        if s.contains("storm") {
            s2 = "blustery"
        }else if s.contains("cloudly") || s.contains("cloud"){
            s2 = "nublado"
        }else if s.contains("snow"){
            s2 = "snow"
        }else if s.contains("rain"){
            s2 = "rainy"
        }else{
            s2 = "sunny"
        }
        return UIImage(named: s2)!
    }

    
    override func viewDidAppear(_ animated: Bool) {
        if let _: ClimaJson = clima {
            refresh()
            
        }
    }
    
    func refresh(){
        if let c: ClimaJson = clima {  
            name.text = c.results.cityName
            data.text = c.results.date
            img.image = getImg(s: c.results.conditionSlug)
            name.isHidden = false
            data.isHidden = false
            img.isHidden = false
            self.utb.reloadData()
        }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let c: ClimaJson = clima {
           return c.results.forecast!.count
        }
        return 0
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellClimaPesquisa", for: indexPath as IndexPath)
        let forecast: Forecast = clima.results.forecast[indexPath.row]
         let cell = tableView.dequeueReusableCell(withIdentifier: "cellClimaPesquisa", for: indexPath) as! NovaCell
        
        cell.nameCell.text = forecast.condition
        print(forecast.condition)
        cell.dataCell.text = forecast.date
        cell.imgCell.image = getImg(s: forecast.condition)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}








class NovaCell: UITableViewCell {
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var dataCell: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
}


