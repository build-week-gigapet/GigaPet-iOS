//
//  ChildDetailModel.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/26/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

struct Child {
    var name: String
    var favoriteFoods: String
    var foodAllergies: String
    var foodEntries: [FoodEntry]?
    
    init(name: String, favoriteFoods: String, foodAllergies: String, foodsEaten: FoodEntry?) {
        self.name = name
        self.favoriteFoods = favoriteFoods
        self.foodAllergies = foodAllergies
    
    }
}
