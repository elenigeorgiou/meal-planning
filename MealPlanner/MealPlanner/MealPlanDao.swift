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
            scrambledEgg.instructions = "1. Scramble 1 egg in a pan coated with cooking spray \n2. Place egg between 2 slices 100% whole wheat bread \n3. Serve with 1/2 cup strawberries and black coffee"
            scrambledEgg.protein = 10
            scrambledEgg.carbs = 34
            scrambledEgg.fat = 5
            scrambledEgg.calories = 250
            scrambledEgg.mealType = Meal.MealType.Breakfast
            scrambledEgg.image = "eggs.jpg"
            scrambledEgg.totaltime = 10
            scrambledEgg.preptime = 3
            scrambledEgg.ingredients = [FoodItem]()
            scrambledEgg.ingredients?.append(FoodItem(name: "Whole Wheat Bread", price: 2.99, quantity: "2 slices", foodType: FoodItem.FoodType.Pantry))
            scrambledEgg.ingredients?.append(FoodItem(name: "Strawberries", price: 2.99, quantity: "500 grams", foodType: FoodItem.FoodType.Produce))
            scrambledEgg.ingredients?.append(FoodItem(name: "Egg", price: 3.99, quantity: "6", foodType: FoodItem.FoodType.Dairy))
            meals.updateValue(scrambledEgg, forKey: scrambledEgg.name!)
            breakfastMeals.updateValue(scrambledEgg, forKey: scrambledEgg.name!)
            
            let canadianBacon: Meal = Meal()
            canadianBacon.name = "Canadian Bacon Pocket with Egg, Tomato and Lettuce"
            canadianBacon.mealType = Meal.MealType.Breakfast
            canadianBacon.instructions = "1. Turn oven to broil. Place Canadian bacon on a sheet tray and cook for 2 minutes. \n2. Split open pita and spread mayonnaise inside. \n3. Cut bacon in half and lay on the bottom half of pita. Fill with egg, lettuce and tomato."
            canadianBacon.protein = 16
            canadianBacon.carbs = 22
            canadianBacon.fat = 10
            canadianBacon.calories = 236
            canadianBacon.image = "canadian.png"
            canadianBacon.preptime = 5
            canadianBacon.totaltime = 10
            canadianBacon.ingredients = [FoodItem]()
            canadianBacon.ingredients?.append(FoodItem(name: "Canadian Bacon or Turkey Bacon", price: 2.99, quantity: "1 slices", foodType: FoodItem.FoodType.Meat))
            canadianBacon.ingredients?.append(FoodItem(name: "Whole Wheat Pita", price: 1.00, quantity: "1/2 slices", foodType: FoodItem.FoodType.Pantry))
            canadianBacon.ingredients?.append(FoodItem(name: "Mayonnaise", price: 2.99, quantity: "1 tablespoon", foodType: FoodItem.FoodType.Pantry))
            canadianBacon.ingredients?.append(FoodItem(name: "Egg", price: 3.99, quantity: "1", foodType: FoodItem.FoodType.Dairy))
            canadianBacon.ingredients?.append(FoodItem(name: "Romaine Lettuce", price: 1.99, quantity: "2 leaves", foodType: FoodItem.FoodType.Produce))
            canadianBacon.ingredients?.append(FoodItem(name: "Tomato", price: 1.50, quantity: "2 slices", foodType: FoodItem.FoodType.Produce))
            meals.updateValue(canadianBacon, forKey: canadianBacon.name!)
            breakfastMeals.updateValue(canadianBacon, forKey: canadianBacon.name!)
            
            
            
            let englishMuffin: Meal = Meal()
            englishMuffin.name = "English Muffin with Peanut Butter"
            englishMuffin.mealType = Meal.MealType.Breakfast

            englishMuffin.instructions = "1. Toast English Muffin. \n2. Top with peanut butter and sliced apple. \n3. Serve with Latte or chai made from 1 cup milk."
            englishMuffin.protein = 15
            englishMuffin.carbs = 32
            englishMuffin.fat = 8
            englishMuffin.totaltime = 5
            englishMuffin.calories = 260
            englishMuffin.image = "english.png"
            englishMuffin.ingredients = [FoodItem]()
            englishMuffin.ingredients?.append(FoodItem(name: "English Muffin", price: 2.25, quantity: "1/2 slice", foodType: FoodItem.FoodType.Pantry))
            englishMuffin.ingredients?.append(FoodItem(name: "Peanut Butter", price: 2.50, quantity: "1 tablespoon", foodType: FoodItem.FoodType.Pantry))
            englishMuffin.ingredients?.append(FoodItem(name: "Apple", price: 1.00, quantity: "100 grams", foodType: FoodItem.FoodType.Produce))

            meals.updateValue(englishMuffin, forKey: englishMuffin.name!)
            breakfastMeals.updateValue(englishMuffin, forKey: englishMuffin.name!)
         
            
            let yogurtOats: Meal = Meal()
            yogurtOats.name = "Yogurt, Oats, and Raspberries"
            yogurtOats.mealType = Meal.MealType.Breakfast
            yogurtOats.instructions = "1. Cook oats on medium heat with 1 cup water. \n2. Transfer cooked oats to bowl and add yogurt. \n3. Top with berries and honey."
            yogurtOats.protein = 20
            yogurtOats.carbs = 25
            yogurtOats.fat = 5
            yogurtOats.preptime = 5
            yogurtOats.totaltime = 10
            yogurtOats.calories = 225
            yogurtOats.image = "yogurtoats.png"
            yogurtOats.ingredients = [FoodItem]()
            yogurtOats.ingredients?.append(FoodItem(name: "Rolled Oats", price: 1.50, quantity: "1/2 cup", foodType: FoodItem.FoodType.Pantry))
            yogurtOats.ingredients?.append(FoodItem(name: "Honey", price: 1.50, quantity: "1 teaspoon", foodType: FoodItem.FoodType.Pantry))
            yogurtOats.ingredients?.append(FoodItem(name: "Non-fat Greek Yogurt", price: 0.99, quantity: "6 ounces", foodType: FoodItem.FoodType.Dairy))
            yogurtOats.ingredients?.append(FoodItem(name: "Raspberries", price: 1.50, quantity: ".5 cup", foodType: FoodItem.FoodType.Produce))
            meals.updateValue(yogurtOats, forKey: yogurtOats.name!)
            breakfastMeals.updateValue(yogurtOats, forKey: yogurtOats.name!)
        }
        return breakfastMeals.sorted {$0.key < $1.key}
    }
    
    static func getLunchOptions() -> [(key: String, value: Meal)] {
        if (lunchMeals.isEmpty) {
            let tunaFish: Meal = Meal()
            tunaFish.name = "Tuna Fish Melt Quesadilla"
            tunaFish.instructions = "1. In a bowl, combine tuna, mayonnaise, mustard and onion.\n2. Place a heavy bottom skillet over medium heat. \n3. Place tomato slices on one half of wrap. Spread tuna mixture over tomatoes and top with mozzarella (the other half of the wrap will have nothing on it). \n4. Fold wrap in half and brush with olive oil. \n5. Place wrap in pan and cook until golden brown, about 3 minutes. Flip and cook 2 more minutes. Serve. \n"
            tunaFish.protein = 44
            tunaFish.carbs = 29
            tunaFish.fat = 12
            tunaFish.calories = 405
            tunaFish.servings = 1
            tunaFish.mealType = Meal.MealType.Lunch
            tunaFish.image = "tuna.jpg"
            tunaFish.preptime = 5
            tunaFish.totaltime = 10
            tunaFish.ingredients = [FoodItem]()
            tunaFish.ingredients?.append(FoodItem(name: "Tuna", price: 2.99, quantity: "5 ounces", foodType: FoodItem.FoodType.Meat))
            tunaFish.ingredients?.append(FoodItem(name: "Mayonnaise", price: 4.99, quantity: "1 jar", foodType: FoodItem.FoodType.Pantry))
            tunaFish.ingredients?.append(FoodItem(name: "Mustard", price: 4.99, quantity: "1 jar", foodType: FoodItem.FoodType.Pantry))
            tunaFish.ingredients?.append(FoodItem(name: "Onion", price: 0.54, quantity: "2", foodType: FoodItem.FoodType.Produce))
            meals.updateValue(tunaFish, forKey: tunaFish.name!)
            lunchMeals.updateValue(tunaFish, forKey: tunaFish.name!)
            
            let chickenWaldorf: Meal = Meal()
            chickenWaldorf.name = "Chicken Waldorf Salad"
            chickenWaldorf.mealType = Meal.MealType.Lunch
            chickenWaldorf.instructions = "1. In a medium bowl, combine mayonnaise, yogurt and lemon juice.\n2. Mix in chicken, apple, celery, grapes and walnuts. Serve. \n"
            chickenWaldorf.protein = 37
            chickenWaldorf.carbs = 23
            chickenWaldorf.fat = 17
            chickenWaldorf.calories = 372
            chickenWaldorf.preptime = 10
            chickenWaldorf.totaltime = 10
            chickenWaldorf.image = "waldorf.png"
            chickenWaldorf.ingredients = [FoodItem]()
            chickenWaldorf.ingredients?.append(FoodItem(name: "Rotisserie Chicken", price: 4.99, quantity: "4 ounces", foodType: FoodItem.FoodType.Meat))
            chickenWaldorf.ingredients?.append(FoodItem(name: "Mayonnaise", price: 4.99, quantity: "1 tablespoon", foodType: FoodItem.FoodType.Pantry))
            chickenWaldorf.ingredients?.append(FoodItem(name: "Non-fat Greek Yogurt", price: 0.99, quantity: "1 tablespoon", foodType: FoodItem.FoodType.Dairy))
            chickenWaldorf.ingredients?.append(FoodItem(name: "Celery", price: 0.54, quantity: "1/4 cup", foodType: FoodItem.FoodType.Produce))
            chickenWaldorf.ingredients?.append(FoodItem(name: "Lemon", price: 0.50, quantity: "1/2 teaspoon juice", foodType: FoodItem.FoodType.Produce))
             chickenWaldorf.ingredients?.append(FoodItem(name: "Apple", price: 0.70, quantity: "1/2", foodType: FoodItem.FoodType.Produce))
             chickenWaldorf.ingredients?.append(FoodItem(name: "Grapes", price: 2.99, quantity: "1/2 cup", foodType: FoodItem.FoodType.Produce))
            chickenWaldorf.ingredients?.append(FoodItem(name: "Walnuts", price: 1.99, quantity: "2 tablespoons", foodType: FoodItem.FoodType.Pantry))
            meals.updateValue(chickenWaldorf, forKey: chickenWaldorf.name!)
            lunchMeals.updateValue(chickenWaldorf, forKey: chickenWaldorf.name!)
            
            let whiteBean: Meal = Meal()
            whiteBean.name = "White Bean and Spinach Soup"
            whiteBean.mealType = Meal.MealType.Lunch
            whiteBean.instructions = "1. Heat a large heavy bottom pot over medium heat. \n2. Add oil, carrot, onion and garlic. Cook, stirring constantly, for 3 minutes.\n3. Add 6 cups water, beans, sage and tomatoes. Bring to a simmer and cook for 10 minutes.\n4. Add spinach and salt. Bring back to a simmer and stir. \n5.Evenly divide into four soup bowls. Top each with 2 tablespoons Parmesan. Serve hot."
            whiteBean.protein = 17
            whiteBean.carbs = 37
            whiteBean.preptime = 10
            whiteBean.totaltime = 30
            whiteBean.fat = 7
            whiteBean.calories = 262
            whiteBean.servings = 4
            whiteBean.image = "whitebean.png"
            whiteBean.ingredients = [FoodItem]()
            whiteBean.ingredients?.append(FoodItem(name: "Olive Oil", price: 9.99, quantity: "2 tablespoons", foodType: FoodItem.FoodType.Pantry))
            whiteBean.ingredients?.append(FoodItem(name: "Carrot", price: 0.60, quantity: "1", foodType: FoodItem.FoodType.Produce))
            whiteBean.ingredients?.append(FoodItem(name: "Onion", price: 0.99, quantity: "1", foodType: FoodItem.FoodType.Produce))
            whiteBean.ingredients?.append(FoodItem(name: "White Beans", price: 1.50, quantity: "1 can", foodType: FoodItem.FoodType.Pantry))
            whiteBean.ingredients?.append(FoodItem(name: "Sage", price: 0.50, quantity: "2 teaspoon", foodType: FoodItem.FoodType.Produce))
            whiteBean.ingredients?.append(FoodItem(name: "Canned Tomatoes", price: 0.99, quantity: "1 can", foodType: FoodItem.FoodType.Pantry))
            whiteBean.ingredients?.append(FoodItem(name: "Spinach", price: 2.99, quantity: "8 cups", foodType: FoodItem.FoodType.Produce))
            whiteBean.ingredients?.append(FoodItem(name: "Parmesan Cheese", price: 3.99, quantity: "8 tablespoons", foodType: FoodItem.FoodType.Dairy))
             whiteBean.ingredients?.append(FoodItem(name: "Salt", price: 2.99, quantity: "1/2 teaspoon", foodType: FoodItem.FoodType.Pantry))

            meals.updateValue(whiteBean, forKey: whiteBean.name!)
            lunchMeals.updateValue(whiteBean, forKey: whiteBean.name!)
            
            let turkeyOpen: Meal = Meal()
            turkeyOpen.name = "Turkey Open-Faced Sandwich"
            turkeyOpen.mealType = Meal.MealType.Lunch
            turkeyOpen.instructions = "1. Preheat oven to 375°. Place bacon on a sheet tray and cook in oven until browned, about 5 minutes. \n2. Spread mayonnaise on bread and top with lettuce, sliced turkey, tomato and bacon. Serve. \n"
            turkeyOpen.protein = 35
            turkeyOpen.carbs = 19
            turkeyOpen.fat = 14
            turkeyOpen.preptime = 5
            turkeyOpen.totaltime = 10
            turkeyOpen.calories = 286
            turkeyOpen.image = "turkey.png"
            turkeyOpen.ingredients = [FoodItem]()
            turkeyOpen.ingredients?.append(FoodItem(name: "Turkey Bacon", price: 4.59, quantity: "2 slices", foodType: FoodItem.FoodType.Meat))
            turkeyOpen.ingredients?.append(FoodItem(name: "Turkey Breast", price: 4.49, quantity: "3 ounces", foodType: FoodItem.FoodType.Meat))
            turkeyOpen.ingredients?.append(FoodItem(name: "Mayonnaise", price: 4.99, quantity: "1 tablespoon", foodType: FoodItem.FoodType.Pantry))
            turkeyOpen.ingredients?.append(FoodItem(name: "Tomato", price: 0.78, quantity: "2 slices", foodType: FoodItem.FoodType.Produce))
            turkeyOpen.ingredients?.append(FoodItem(name: "Romaine Lettuce", price: 0.99, quantity: "2 leaves", foodType: FoodItem.FoodType.Produce))
            turkeyOpen.ingredients?.append(FoodItem(name: "Whole Wheat Bread", price: 2.99, quantity: "1 slice", foodType: FoodItem.FoodType.Pantry))
            meals.updateValue(turkeyOpen, forKey: turkeyOpen.name!)
            lunchMeals.updateValue(turkeyOpen, forKey: turkeyOpen.name!)
            

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
            herbCrusted.preptime = 5
            herbCrusted.totaltime = 20
            herbCrusted.servings = 1
            herbCrusted.mealType = Meal.MealType.Dinner
            herbCrusted.image = "salmon.jpg"
            herbCrusted.ingredients = [FoodItem]()
            herbCrusted.ingredients?.append(FoodItem(name: "Salmon", price: 7.99, quantity: "5 ounces", foodType: FoodItem.FoodType.Meat))
            herbCrusted.ingredients?.append(FoodItem(name: "Spinach", price: 2.27, quantity: "500 grams", foodType: FoodItem.FoodType.Produce))
            herbCrusted.ingredients?.append(FoodItem(name: "Salt", price: 3.23, quantity: "93 grams", foodType: FoodItem.FoodType.Pantry))
            herbCrusted.ingredients?.append(FoodItem(name: "Pepper", price: 4.23, quantity: "93 grams", foodType: FoodItem.FoodType.Pantry))
            meals.updateValue(herbCrusted, forKey: herbCrusted.name!)
            dinnerMeals.updateValue(herbCrusted, forKey: herbCrusted.name!)
            
            let broiledShrimp: Meal = Meal()
            broiledShrimp.name = "Broiled Shrimp with Lemon, Garlic and Spinach"
            broiledShrimp.mealType = Meal.MealType.Dinner
            
            broiledShrimp.instructions = "1. Preheat oven to broil.\n2. In a large bowl, combine shrimp, garlic, oregano, 2 teaspoons oil and pepper to taste; mix thoroughly. \n3. In another bowl, toss spinach, beans and remaining teaspoon oil.\n4. Place shrimp in a single layer on a sheet tray and broil until just pink, about 3 to 5 minutes, depending on your broiler. Remove from oven and toss with spinach. Return to oven and cook for 1 more minute.\n5. Place cracker crumb mixture on top of herbs and pat to make a crust.\n6. Squeeze lemon on shrimp and serve immediately."
            broiledShrimp.protein = 25
            broiledShrimp.carbs = 28
            broiledShrimp.fat = 6
            broiledShrimp.calories = 260
            broiledShrimp.preptime = 5
            broiledShrimp.totaltime = 10
            broiledShrimp.servings = 1
            broiledShrimp.image = "shrimp.png"
            broiledShrimp.ingredients = [FoodItem]()
            broiledShrimp.ingredients?.append(FoodItem(name: "Shrimp", price: 7.99, quantity: "4 ounces", foodType: FoodItem.FoodType.Meat, description: "peeled and deveined"))
            broiledShrimp.ingredients?.append(FoodItem(name: "Spinach", price: 2.27, quantity: "500 grams", foodType: FoodItem.FoodType.Produce))
            broiledShrimp.ingredients?.append(FoodItem(name: "Oregano", price: 3.00, quantity: "1 teaspoon", foodType: FoodItem.FoodType.Pantry))
            broiledShrimp.ingredients?.append(FoodItem(name: "Olive Oil", price: 9.99, quantity: "3 teaspoons", foodType: FoodItem.FoodType.Pantry, description: "split"))
            broiledShrimp.ingredients?.append(FoodItem(name: "Garlic", price: 4.23, quantity: "1 clove", foodType: FoodItem.FoodType.Pantry, description: "minced"))
            broiledShrimp.ingredients?.append(FoodItem(name: "Pepper", price: 4.23, quantity: "1 pinch", foodType: FoodItem.FoodType.Pantry))
            broiledShrimp.ingredients?.append(FoodItem(name: "White Beans", price: 1.50, quantity: "1/4 can", foodType: FoodItem.FoodType.Pantry))
             broiledShrimp.ingredients?.append(FoodItem(name: "Lemon", price: 0.50, quantity: "1/2", foodType: FoodItem.FoodType.Pantry, description: "cut into wedges"))
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
    
    static func getGroceriesForMeals(forMeals meals: [Meal]) -> [FoodItem.FoodType: [FoodItem]] {
        var ingredientsByType: [FoodItem.FoodType: [FoodItem]] = [:]
        for meal in meals {
            if (meal.ingredients != nil) {
                for foodItem in meal.ingredients! {
                    if ingredientsByType[foodItem.foodType!] == nil {
                        ingredientsByType[foodItem.foodType!] = [FoodItem]()
                    }
                    ingredientsByType[foodItem.foodType!]?.append(foodItem)
                }
            }
        }
        return ingredientsByType
    }
}
