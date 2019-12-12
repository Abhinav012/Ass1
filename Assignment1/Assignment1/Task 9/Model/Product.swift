//
//  Store.swift
//  Assignment1
//
//  Created by Thanos on 12/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation

class Product
{
    var productId: String
    var productName: String
    var productPrice: Double
    
    init(productId: String, productName: String, productPrice: Double) {
        self.productId = productId
        self.productName = productName
        self.productPrice = productPrice
    }
    
}
