//
//  XMLModel.swift
//  Assignment1
//
//  Created by Thanos on 10/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation

class Item {
    var author = "";
    var desc = "";
    var tag = [Tag]();
}

class Tag {
    var name = "";
    var count: Int?;
}
