//
//  ChildDetailModel.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/26/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

struct ChildDetail {
    var child: Child
    var favoriteFoods: String
    var foodAllergies: String
    var foodsEaten: [FoodEntry]?
    
    init(child: Child, favoriteFoods: String, foodAllergies: String, foodsEaten: FoodEntry?) {
        self.child = child
        self.favoriteFoods = favoriteFoods
        self.foodAllergies = foodAllergies
    
    }
}
