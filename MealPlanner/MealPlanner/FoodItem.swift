//
//  FoodItem.swift
//  MealPlanner
//
//  Created by Vivek Rao on 7/8/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation

class FoodItem {
    init(name: String, price: Float, quantity: String, foodType: FoodType) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.foodType = foodType
        self.description = ""
    }
    init(name: String, price: Float, quantity: String, foodType: FoodType, description: String) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.foodType = foodType
        self.description = description
    }
    
    enum FoodType {
        case Produce
        case Dairy
        case Meat
        case Pantry
        case Frozen
    }
    
    var name: String?
    var price: Float?
    var quantity: String?
    var foodType: FoodType?
    var description: String?
}
