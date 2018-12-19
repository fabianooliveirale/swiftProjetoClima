//
//  HistoricoDao.swift
//  ProjetoClima
//
//  Created by Anderson Soares on 18/12/18.
//  Copyright © 2018 exemplos. All rights reserved.
//

import Foundation


class HistoricoDao {
    
    var climas: [ClimaJson] = []
    
    func salvar(clima: ClimaJson){
        climas = listar()
        if let c: [ClimaJson] = climas{
            climas.append(clima)
        }
        
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: climas)
        userDefaults.set(encodedData, forKey: "historico")
        userDefaults.synchronize()
    }
    
    func listar() -> [ClimaJson] {
        let userDefaults = UserDefaults.standard
        if let decoded = userDefaults.object(forKey: "historico"){
            let array = try NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as! [ClimaJson]
            return array
        } else {
            return []
        }
    }
    
    func remove(index: Int) {
        climas = listar()
        climas.remove(at: index)
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: climas)
        userDefaults.set(encodedData, forKey: "historico")
        userDefaults.synchronize()
    }
    
}
