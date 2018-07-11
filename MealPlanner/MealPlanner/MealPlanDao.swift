//
//  MealPlanDao.swift
//  MealPlanner
//
//  Created by Vivek Rao on 7/3/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation

class MealPlanDao {
    static var meals: [String: Meal] = [:]
    static var breakfastMeals: [String: Meal] = [:]
    static var lunchMeals: [String: Meal] = [:]
    static var dinnerMeals: [String: Meal] = [:]
    
    static func getBreakfastOptions() -> [(key: String, value: Meal)] {
        if (breakfastMeals.isEmpty) {
            let scrambledEgg: Meal = Meal()
            scrambledEgg.name = "Scrambled Egg Sandwich"
            scrambledEgg.instructions = "1.Scramble 1 egg in a pan coated with cooking spray \n2. Place egg between 2 slices 100% whole wheat bread \n3. Serve with 1/2 cup strawberries and black coffee"
            scrambledEgg.protein = 10
            scrambledEgg.carbs = 34
            scrambledEgg.fat = 5
            scrambledEgg.calories = 250
            scrambledEgg.mealType = Meal.MealType.Breakfast
            scrambledEgg.image = "eggs.jpg"
            scrambledEgg.ingredients?.append(FoodItem(name: "Whole Wheat Bread", price: 2.99, quantity: "20 slices", foodType: FoodItem.FoodType.Pantry))
            scrambledEgg.ingredients?.append(FoodItem(name: "Strawberries", price: 2.99, quantity: "500 grams", foodType: FoodItem.FoodType.Produce))
            scrambledEgg.ingredients?.append(FoodItem(name: "Egg", price: 3.99, quantity: "6", foodType: FoodItem.FoodType.Dairy))
            meals.updateValue(scrambledEgg, forKey: scrambledEgg.name!)
            breakfastMeals.updateValue(scrambledEgg, forKey: scrambledEgg.name!)
            
            let canadianBacon: Meal = Meal()
            canadianBacon.name = "Canadian Bacon Pocket with Egg, Tomato and Lettuce"
            canadianBacon.mealType = Meal.MealType.Breakfast
            meals.updateValue(canadianBacon, forKey: canadianBacon.name!)
            breakfastMeals.updateValue(canadianBacon, forKey: canadianBacon.name!)
            
            let englishMuffin: Meal = Meal()
            englishMuffin.name = "English Muffin with Peanut Butter"
            englishMuffin.mealType = Meal.MealType.Breakfast
            meals.updateValue(englishMuffin, forKey: englishMuffin.name!)
            breakfastMeals.updateValue(englishMuffin, forKey: englishMuffin.name!)
            
            let yogurtOats: Meal = Meal()
            yogurtOats.name = "Yogurt, Oats, and Raspberries"
            yogurtOats.mealType = Meal.MealType.Breakfast
            meals.updateValue(yogurtOats, forKey: yogurtOats.name!)
            breakfastMeals.updateValue(yogurtOats, forKey: yogurtOats.name!)
        }
        return breakfastMeals.sorted {$0.key < $1.key}
    }
    
    static func getLunchOptions() -> [(key: String, value: Meal)] {
        if (lunchMeals.isEmpty) {
            let tunaFish: Meal = Meal()
            tunaFish.name = "Tuna Fish Melt Quesadilla"
            tunaFish.instructions = "1.In a bowl, combine tuna, mayonnaise, mustard and onion.\n2. Place a heavy bottom skillet over medium heat. \n3. Place tomato slices on one half of wrap. Spread tuna mixture over tomatoes and top with mozzarella (the other half of the wrap will have nothing on it). \n4. Fold wrap in half and brush with olive oil. \n5. Place wrap in pan and cook until golden brown, about 3 minutes. Flip and cook 2 more minutes. Serve. \n"
            tunaFish.protein = 44
            tunaFish.carbs = 29
            tunaFish.fat = 12
            tunaFish.calories = 405
            tunaFish.mealType = Meal.MealType.Lunch
            tunaFish.image = "tuna.jpg"
            tunaFish.ingredients?.append(FoodItem(name: "Tuna", price: 2.99, quantity: "5 ounces", foodType: FoodItem.FoodType.Meat))
            tunaFish.ingredients?.append(FoodItem(name: "Mayonnaise", price: 4.99, quantity: "1 jar", foodType: FoodItem.FoodType.Pantry))
            tunaFish.ingredients?.append(FoodItem(name: "Mustard", price: 4.99, quantity: "1 jar", foodType: FoodItem.FoodType.Pantry))
            tunaFish.ingredients?.append(FoodItem(name: "Onion", price: 0.54, quantity: "2", foodType: FoodItem.FoodType.Produce))
            meals.updateValue(tunaFish, forKey: tunaFish.name!)
            lunchMeals.updateValue(tunaFish, forKey: tunaFish.name!)
            
            let chickenWaldorf: Meal = Meal()
            chickenWaldorf.name = "Chicken Waldorf Salad"
            chickenWaldorf.mealType = Meal.MealType.Lunch
            meals.updateValue(chickenWaldorf, forKey: chickenWaldorf.name!)
            lunchMeals.updateValue(chickenWaldorf, forKey: chickenWaldorf.name!)
            
            let whiteBean: Meal = Meal()
            whiteBean.name = "White Bean and Spinach Soup"
            whiteBean.mealType = Meal.MealType.Lunch
            meals.updateValue(whiteBean, forKey: whiteBean.name!)
            lunchMeals.updateValue(whiteBean, forKey: whiteBean.name!)
            
            let chickPea: Meal = Meal()
            chickPea.name = "Chickpea Salad"
            chickPea.mealType = Meal.MealType.Lunch
            meals.updateValue(chickPea, forKey: chickPea.name!)
            lunchMeals.updateValue(chickPea, forKey: chickPea.name!)
            
            let minestrone: Meal = Meal()
            minestrone.name = "Minestrone Soup"
            minestrone.mealType = Meal.MealType.Lunch
            meals.updateValue(minestrone, forKey: minestrone.name!)
            lunchMeals.updateValue(minestrone, forKey: minestrone.name!)
        }
        return lunchMeals.sorted {$0.key < $1.key}
    }
    
    static func getDinnerOptions() ->  [(key: String, value: Meal)] {
        if (dinnerMeals.isEmpty) {
            let herbCrusted: Meal = Meal()
            herbCrusted.name = "Herb-Crusted Salmon"
            herbCrusted.instructions = "1. Preheat oven to 425°.\n2. Season salmon with oil, 1⁄8 teaspoon salt and black pepper to taste.\n3. Place salmon on a sheet tray and top with herbs.\n4. In a medium bowl, thoroughly combine cracker crumbs, eggs and remaining 1⁄8 teaspoon salt and additional black pepper to taste.\n5. Place cracker crumb mixture on top of herbs and pat to make a crust.\n6. Place sheet tray in oven and bake until there is just a little bit of pink in the middle of the salmon, about 5 minutes depending on the thickness of the fish. Turn oven to broil and cook for an additional 2 minutes to brown crust, taking care not to burn. Serve with a wedge of lemon."
            herbCrusted.protein = 29
            herbCrusted.carbs = 14
            herbCrusted.fat = 9
            herbCrusted.calories = 253
            herbCrusted.mealType = Meal.MealType.Dinner
            herbCrusted.image = "salmon.jpg"
            herbCrusted.ingredients?.append(FoodItem(name: "Salmon", price: 7.99, quantity: "5 ounces", foodType: FoodItem.FoodType.Meat))
            herbCrusted.ingredients?.append(FoodItem(name: "Spinach", price: 2.27, quantity: "500 grams", foodType: FoodItem.FoodType.Produce))
            herbCrusted.ingredients?.append(FoodItem(name: "Salt", price: 3.23, quantity: "93 grams", foodType: FoodItem.FoodType.Pantry))
            herbCrusted.ingredients?.append(FoodItem(name: "Pepper", price: 4.23, quantity: "93 grams", foodType: FoodItem.FoodType.Pantry))
            meals.updateValue(herbCrusted, forKey: herbCrusted.name!)
            dinnerMeals.updateValue(herbCrusted, forKey: herbCrusted.name!)
            
            let broiledShrimp: Meal = Meal()
            broiledShrimp.name = "Broiled Shrimp with Lemon, Garlic and Spinach"
            broiledShrimp.mealType = Meal.MealType.Dinner
            meals.updateValue(broiledShrimp, forKey: broiledShrimp.name!)
            dinnerMeals.updateValue(broiledShrimp, forKey: broiledShrimp.name!)
            
            let chickenSalad: Meal = Meal()
            chickenSalad.name = "Dinner Rotisserie Chicken Salad"
            chickenSalad.mealType = Meal.MealType.Dinner
            meals.updateValue(chickenSalad, forKey: chickenSalad.name!)
            dinnerMeals.updateValue(chickenSalad, forKey: chickenSalad.name!)
            
            let chickenParm: Meal = Meal()
            chickenParm.name = "Chicken Parm Sub"
            chickenParm.mealType = Meal.MealType.Dinner
            meals.updateValue(chickenParm, forKey: chickenParm.name!)
            dinnerMeals.updateValue(chickenParm, forKey: chickenParm.name!)
            
            let grilledChicken: Meal = Meal()
            grilledChicken.name = "Grilled Chicken"
            grilledChicken.mealType = Meal.MealType.Dinner
            meals.updateValue(grilledChicken, forKey: grilledChicken.name!)
            dinnerMeals.updateValue(grilledChicken, forKey: grilledChicken.name!)
        }
        return dinnerMeals.sorted {$0.key < $1.key}
    }
    
    static func getMealByName(forKey mealName: String) -> Meal {
        return meals[mealName]!
    }
    
    static func getBreakfastMealByName(forKey mealName: String) -> Meal {
        return breakfastMeals[mealName]!
    }
    
    static func getLunchMealByName(forKey mealName: String) -> Meal {
        return lunchMeals[mealName]!
    }
    
    static func getDinnerMealByName(forKey mealName: String) -> Meal {
        return dinnerMeals[mealName]!
    }
    
    static func getDefaultBreakfast() -> Meal {
        return breakfastMeals["Scrambled Egg Sandwich"]!
    }
    
    static func getDefaultLunch() -> Meal {
        return lunchMeals["Tuna Fish Melt Quesadilla"]!
    }
    
    static func getDefaultDinner() -> Meal {
        return dinnerMeals["Herb-Crusted Salmon"]!
    }
}
