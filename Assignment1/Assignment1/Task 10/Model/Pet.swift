//
//  Pet.swift
//  Assignment1
//
//  Created by Thanos on 13/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation
import RealmSwift

class Pet: Object{
    @objc dynamic var petName = ""
    @objc dynamic var owner : User?
}
