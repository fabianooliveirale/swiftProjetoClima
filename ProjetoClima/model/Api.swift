//
//  Api.swift
//  ProjetoClima
//
//  Created by Anderson Soares on 15/12/18.
//  Copyright © 2018 exemplos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Api{
    private static let rota = "https://api.hgbrasil.com/"
    //private static let woeid = "455822"
    
    static func climaDetalhes(woeid: String, completion: @escaping (_ response: ClimaJson) -> Void) {
        if let url = URL(string: rota+"weather?woeid="+woeid){
            Alamofire.request(url, method: .get)
                .responseJSON { response in
                    
                    let status:Int = response.response?.statusCode ?? 0
                    
                    let json = JSON(response.result.value as Any)
                    let object = ClimaJson(fromJson: json)
                    
                    completion(object)
            }
        }
    }
}
