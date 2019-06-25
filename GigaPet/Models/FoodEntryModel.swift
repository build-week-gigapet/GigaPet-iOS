//
//  FoodEntryModel.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

struct FoodEntry: Codable {
    var id: Int
    var name: String
    var category: Int
    var date_added: Data
    var date_updated: Data
    var is_used: Bool
}
