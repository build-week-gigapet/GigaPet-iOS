//
//  FoodEntryModel.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

struct FoodEntry: Codable {
    var name: String
    var category: Int
    var date_added: Data
}
