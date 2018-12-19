//
//  ClimaJsonDao.swift
//  TrabalhandoComMapas
//
//  Created by Anderson Soares on 14/12/18.
//  Copyright © 2018 exemplos. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import SVProgressHUD

class ClimaDao{
    
    var climas: [ClimaJson] = []
    
    
    func salvar(clima: ClimaJson){
        climas.append(clima)
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: climas)
        userDefaults.set(encodedData, forKey: "climaJson2")
        userDefaults.synchronize()
        print("SALVO O PARCERINHO")
    }
    
    func listar() -> [ClimaJson] {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.object(forKey: "climaJson2") as! Data
        let array = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [ClimaJson]
        print("AKI: "+String(array.count))
        return array
    }
    
    func remove(index: Int) {
        climas = listar()
        climas.remove(at: index)
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: climas)
        userDefaults.set(encodedData, forKey: "climaJson2")
        userDefaults.synchronize()
    }
    
    
}
