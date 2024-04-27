//
//  DictExt.swift
//  chpl
//
//  Created by Noor Ahmed on 27/04/24.
//

import Foundation


extension Dictionary {
    
    func getData() throws ->  Data {
        let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
        return jsonData
    }
}
