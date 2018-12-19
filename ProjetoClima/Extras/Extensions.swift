//
//  Extensions.swift
//  Bazar de Moveis
//
//  Created by Millena Galvão on 20/02/17.
//  Copyright © 2017 DevMaker Apps. All rights reserved.


import UIKit
import Alamofire
import SVProgressHUD
import MapKit
import VMaskTextField

extension SVProgressHUD {
    open override func awakeFromNib() {
        super.awakeFromNib()
        // foregroundColor = UIColor.bazarRosa
    }
}

extension Alamofire.DataResponse {
    func debugLog() {
        var output: [String] = []
        var datastring = ""
        if let body = request?.httpBody {
            datastring = NSString(data: body, encoding: String.Encoding.utf8.rawValue)! as String
        }
        
        output.append(request != nil ? "[Request]: \(request!)" : "[Request]: nil")
        output.append("[Method]: \(String(describing: request?.httpMethod))")
        output.append("[Body]: \(datastring)")
        output.append("[Header]: \(String(describing: request?.allHTTPHeaderFields?.description))")
        output.append("[Result]: \(result.debugDescription)")
        print(output.joined(separator: "\n"))
    }
}
