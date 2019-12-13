//
//  Book.swift
//  Assignment1
//
//  Created by Thanos on 13/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation
struct Book: Codable{
    var title: String?
    var generic: String?
    var price: Double?
    
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case generic = "generic"
        case price = "price"
    }
}
