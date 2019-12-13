//
//  Owner.swift
//  Assignment1
//
//  Created by Thanos on 13/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation
struct Owner: Codable {
    
    var name: String?
    var age: Int?
    var books: [Book]?
    var address: String?
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case age = "age"
        case address = "address"
        case books = "books"
    }
    
}
