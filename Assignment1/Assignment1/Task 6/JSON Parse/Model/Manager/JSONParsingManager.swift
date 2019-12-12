//
//  JSONParsingManager.swift
//  Assignment1
//
//  Created by Thanos on 11/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation

class JSONParsingManager: NSObject{
   
    var parsedValue: String = ""
    
    typealias completion = (_ data:Data)->()
    
    func getData(from url: URL?,completion: @escaping ((Data?)->Void)){
        
        if let url = url {
            let urlRequest = URLRequest(url: url)
            let session = URLSession.shared
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                
                if error == nil{
                    if let data = data{
                        
                            return completion(data)
                    }
                }
            }
            
            task.resume()
        }
        
    }
}
