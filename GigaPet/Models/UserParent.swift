//
//  NewUser.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

struct User: Codable {
    let username: String
    let password: String
    let name: String
    let children: [Child]?
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        self.name = ""
        self.children = []
    }
}
