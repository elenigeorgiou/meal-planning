//
//  FoodItem.swift
//  MealPlanner
//
//  Created by Vivek Rao on 7/8/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation

class FoodItem {
    enum FoodType {
        case Produce
        case Dairy
        case Meat
        case Pantry
        case Frozen
    }
    
    var name: String?
    var price: Int?
    var quantity: Int?
    var foodType: FoodType?
}
