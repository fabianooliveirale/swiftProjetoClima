//
//  PesquisaViewController.swift
//  ProjetoClima
//
//  Created by Anderson Soares on 15/12/18.
//  Copyright © 2018 exemplos. All rights reserved.
//

import UIKit
import SVProgressHUD

class PesquisaViewController: UIViewController {
    
    var txtField1: UITextField!

    @IBAction func pesquisa(_ sender: Any) {
 
        
        let alert = UIAlertController(title: "woeId", message: "Coloque o woeid da cidade.", preferredStyle: .alert)
        // UIAlertControllerStyle.Alert
        
        alert.addTextField(configurationHandler: addTextField1)
        //                alert.addTextField(configurationHandler: addTextField2)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: { (UIAlertAction)in
        }))
        alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertAction.Style.default, handler:{ (UIAlertAction)in
            
            var woeid = (self.txtField1.text!)
            if woeid == "" {
                woeid = "455822"
            }

                    SVProgressHUD.show()
                    Api.climaDetalhes(woeid: "", completion: { item in
                        if let c :ClimaJson = item {
                             let d: ClimaDao = ClimaDao()
                                 d.salvar(clima: c)
                                 
                            let newViewController = ClimaViewController()
                            self.navigationController?.pushViewController(newViewController, animated: true)
                        }
                        SVProgressHUD.dismiss()
                    })
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController!.navigationBar.tintColor = UIColor.black;

    }
    
    func addTextField1(textField: UITextField!)
    {
        textField.placeholder = "Digite da cidade woeId"
        txtField1 = textField
    }

}
