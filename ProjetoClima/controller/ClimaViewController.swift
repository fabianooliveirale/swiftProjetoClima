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
    var clima: ClimaJson?
    var woeid: String = ""
    @IBOutlet weak var utb: UITableView!
    var txtField1: UITextField!
    @IBOutlet weak var temp: UILabel!
    
    
    
    @IBAction func pesquisa(_ sender: Any) {
        
        let alert = UIAlertController(title: "woeId", message: "Coloque o woeid da cidade.", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: addTextField1)
        
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
        var ret = true
        SVProgressHUD.show()
        Api.climaDetalhes(woeid: woeid, completion: { item in
            if let c :ClimaJson = item {
                let dao: HistoricoDao = HistoricoDao()
                    self.clima = c
                    dao.salvar(clima: c)
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
            self.navigationController?.navigationBar.topItem?.title = ""
            self.navigationController!.navigationBar.tintColor = UIColor.white;
            refresh()
    }
    
    func getText (text: String) -> String {
        var s2 = ""
        if text.contains("storm") {
            s2 = "Tempestade"
        }else if text.contains("cloudly") || text.contains("cloud"){
            s2 = "Nublado"
        }else if text.contains("snow"){
            s2 = "Neve"
        }else if text.contains("rain"){
            s2 = "Chuva"
        }else{
            s2 = "Sol"
        }
        return s2
    }
    
    func refresh(){
        if let c: ClimaJson = clima {
                name.text = c.results.cityName
                data.text = c.results.date
                img.image = getImg(s: c.results.conditionSlug)
                temp.text = String(c.results.temp) + "Cº"
                temp.textColor = colorText(num: c.results.temp)
                name.isHidden = false
                data.isHidden = false
                img.isHidden = false
                temp.isHidden = false
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellClimaPesquisa", for: indexPath) as! NovaCell
        
        if let c: ClimaJson = clima {
            if let r: Result = c.results{
                if let f: Forecast = r.forecast[indexPath.row]{
                    cell.nameCell.text = getText(text: f.condition)
                    cell.dataCell.text = f.date
                    cell.max.text = "Max " + String(f.max) + "Cº"
                    cell.min.text = "Min " + String(f.min) + "Cº"
                    cell.max.textColor = colorText(num: Int(f.max)!)
                    cell.min.textColor = colorText(num: Int(f.min)!)
                    cell.imgCell.image = getImg(s: f.condition)
                }
            }
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func colorText (num: Int) -> UIColor {
        if(num > 30) {
            return UIColor.init(displayP3Red: 160/255, green: 0, blue: 0, alpha: 1)
        }else if num < 10 {
            return UIColor.init(displayP3Red: 0, green: 0, blue: 160/255, alpha: 1)
        }
            return UIColor.init(displayP3Red: 0, green: 80/255, blue: 0, alpha: 1)
    }
    
}








class NovaCell: UITableViewCell {
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var dataCell: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var min: UILabel!
    
    
}


