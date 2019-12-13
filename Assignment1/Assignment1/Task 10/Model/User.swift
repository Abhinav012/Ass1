//
//  User.swift
//  Assignment1
//
//  Created by Thanos on 13/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation
import RealmSwift


class User: Object{
    @objc dynamic var name = ""
    @objc dynamic var pet: Pet?
}
