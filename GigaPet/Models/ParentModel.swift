//
//  ParentModel.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

struct Parent: Codable {
    var id: Int
    var name: String
    var children: [Child]
}
