//
//  Meal.swift
//  MealPlanner
//
//  Created by Vivek Rao on 7/5/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation

class Meal {
    enum MealType {
        case Breakfast
        case Lunch
        case Dinner
    }
    
    var name: String?
    var instructions: String?
    var mealType: MealType?
    var calories: Int?
    var protein: Int?
    var carbs: Int?
    var fat: Int?
    var image: String?
    var ingredients: [FoodItem]?
    var servings: Int? = 1
    var preptime: Int? = 5
    var totaltime: Int? = 10
}
