//
//  MealPlanDao.swift
//  MealPlanner
//
//  Created by Vivek Rao on 7/3/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation

class MealPlanDao {
    static var meals: Array<Meal> = [Meal]()
    static var breakfastMeals: Array<Meal> = [Meal]()
    static var lunchMeals: Array<Meal> = [Meal]()
    static var dinnerMeals: Array<Meal> = [Meal]()
    
    static func getBreakfastOptions() -> Array<Meal> {
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
            meals.append(scrambledEgg)
            breakfastMeals.append(scrambledEgg)
            
            let canadianBacon: Meal = Meal()
            canadianBacon.name = "Canadian Bacon Pocket with Egg, Tomato and Lettuce"
            canadianBacon.mealType = Meal.MealType.Breakfast
            meals.append(canadianBacon)
            breakfastMeals.append(canadianBacon)
            
            let englishMuffin: Meal = Meal()
            englishMuffin.name = "English Muffin with Peanut Butter"
            englishMuffin.mealType = Meal.MealType.Breakfast
            meals.append(englishMuffin)
            breakfastMeals.append(englishMuffin)
            
            let yogurtOats: Meal = Meal()
            yogurtOats.name = "Yogurt, Oats, and Raspberries"
            yogurtOats.mealType = Meal.MealType.Breakfast
            meals.append(yogurtOats)
            breakfastMeals.append(yogurtOats)
        }
        return breakfastMeals
    }
    
    static func getLunchOptions() -> Array<Meal> {
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
            meals.append(tunaFish)
            lunchMeals.append(tunaFish)
            
            let chickenWaldorf: Meal = Meal()
            chickenWaldorf.name = "Chicken Waldorf Salad"
            chickenWaldorf.mealType = Meal.MealType.Lunch
            meals.append(chickenWaldorf)
            lunchMeals.append(chickenWaldorf)
            
            let whiteBean: Meal = Meal()
            whiteBean.name = "White Bean and Spinach Soup"
            whiteBean.mealType = Meal.MealType.Lunch
            meals.append(whiteBean)
            lunchMeals.append(whiteBean)
            
            let chickPea: Meal = Meal()
            chickPea.name = "Chickpea Salad"
            chickPea.mealType = Meal.MealType.Lunch
            meals.append(chickPea)
            lunchMeals.append(chickPea)
            
            let minestrone: Meal = Meal()
            minestrone.name = "Minestrone Soup"
            minestrone.mealType = Meal.MealType.Lunch
            meals.append(minestrone)
            lunchMeals.append(minestrone)
        }
        return lunchMeals
    }
    
    static func getDinnerOptions() -> Array<Meal> {
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
            meals.append(herbCrusted)
            dinnerMeals.append(herbCrusted)
            
            let broiledShrimp: Meal = Meal()
            broiledShrimp.name = "Broiled Shrimp with Lemon, Garlic and Spinach"
            broiledShrimp.mealType = Meal.MealType.Dinner
            meals.append(broiledShrimp)
            dinnerMeals.append(broiledShrimp)
            
            let chickenSalad: Meal = Meal()
            chickenSalad.name = "Dinner Rotisserie Chicken Salad"
            chickenSalad.mealType = Meal.MealType.Dinner
            meals.append(chickenSalad)
            dinnerMeals.append(chickenSalad)
            
            let chickenParm: Meal = Meal()
            chickenParm.name = "Chicken Parm Sub"
            chickenParm.mealType = Meal.MealType.Dinner
            meals.append(chickenParm)
            dinnerMeals.append(chickenParm)
            
            let grilledChicken: Meal = Meal()
            grilledChicken.name = "Grilled Chicken"
            grilledChicken.mealType = Meal.MealType.Dinner
            meals.append(grilledChicken)
            dinnerMeals.append(grilledChicken)
        }
        return dinnerMeals
    }
}
