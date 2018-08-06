//
//  EurekaSimpleViewController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 8/6/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class EurekaSimpleViewController: FormViewController {
    
    // Struct for form items tag constants
    struct FormItems {
        static let name = "recipeName"
        static let totalminutes = "totalMinutes"
        static let instructions = "instructions"
        static let servings = "servings"
        static let calories = "calories"
        static let protein = "protein"
        static let carbs = "carbs"
        static let fats = "fats"
        static let ingredients = "ingredients"
        static let mealType = "mealType"
        static let image = "image"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Create Your Own")
            <<< TextRow(FormItems.name) { row in
                row.title = "Recipe Name"
                row.placeholder = "Recipe"
                row.value = ""
            }
            <<< TextRow(FormItems.servings) { row in
                row.title = "Serving Size"
                row.placeholder = "servings"
                row.value = ""
            }
            <<< TextRow(FormItems.totalminutes) { row in
                row.title = "Total Minutes"
                row.placeholder = "minutes"
                row.value = ""
            }
            <<< TextRow(FormItems.calories) { row in
                row.title = "Calories"
                row.placeholder = "calories"
                row.value = ""
            }
            <<< TextRow(FormItems.protein) { row in
                row.title = "Protein"
                row.placeholder = "grams"
                row.value = ""
            }
            <<< TextRow(FormItems.fats) { row in
                row.title = "Fat"
                row.placeholder = "grams"
                row.value = ""
            }
            <<< TextRow(FormItems.carbs) { row in
                row.title = "Carb"
                row.placeholder = "grams"
                row.value = ""
            }
           
            <<< AlertRow<String>(FormItems.mealType) {
                $0.title = "Pick Meal Type"
                $0.selectorTitle = "Pick Meal Type"
                $0.options = ["Breakfast","Lunch","Dinner"]
                $0.value = "Breakfast"    // initially selected
            }
            
            <<< TextAreaRow(FormItems.instructions) { row in
                row.title = "Instructions"
                row.placeholder = "Instructions"
                row.value = ""
            }
            
            +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete],
                                   header: "Ingredients") {
                                    $0.tag = "ingredientsList"
                                    $0.addButtonProvider = { section in
                                        return ButtonRow(){
                                            $0.title = "Add New Ingredient"
                                            }.cellUpdate { cell, row in
                                                cell.textLabel?.textAlignment = .left
                                        }
                                    }
                                    
                                    $0.multivaluedRowToInsertAt = { index in
                                        return TextRow("tag\(index+1)") {
                                            $0.placeholder = "Ingredient"
                                        }
                                    }
                                    $0 <<< TextRow("tag1") {
                                        $0.placeholder = "Add Ingredient"
                            

                                    }
                                    
            }
            +++ Section("")
            
            <<< ButtonRow() { row in
                row.title = "Save"
                row.cell.tintColor = .black
                }.onCellSelection{cell,row in
                    self.save()
        }
        
    }
    
    func save() {
        let formvalues = self.form.values()
        // print(formvalues[FormItems.name] as! String)
        print(formvalues)
        var mealType = formvalues[FormItems.mealType] as? String
        var meal: Meal.MealType = Meal.MealType.Breakfast
        if mealType == "Breakfast" {
            meal = Meal.MealType.Breakfast
        } else if mealType == "Lunch"  {
            meal = Meal.MealType.Lunch
        } else {
            meal = Meal.MealType.Dinner
        }
        
        var list = [FoodItem]()
        let values : [String] = formvalues["ingredientsList"] as! [String]
        for text in values {
            var lineArr = text.lowercased().components(separatedBy: " ")
            let quantity = lineArr[0] + " " + lineArr[1]
            let area = lineArr[2]
            let areaType = area.lowercased() == "produce" ? FoodItem.FoodType.Produce : area.lowercased() == "dairy" ? FoodItem.FoodType.Dairy : area.lowercased() == "meat" || area.lowercased() == "fish" ? FoodItem.FoodType.Meat : FoodItem.FoodType.Pantry
            let food = lineArr[3]
            let item = FoodItem(name: food, price: 0.00, quantity: quantity, foodType: areaType)
            list.insert(item, at: 0)
            
        }
        
        let newRecipe:Meal = Meal()
        newRecipe.name = (formvalues[FormItems.name] as! String)
        newRecipe.instructions = (formvalues[FormItems.instructions] as! String)
        newRecipe.protein = Int((formvalues[FormItems.protein] as? String)!)
        newRecipe.carbs = Int((formvalues[FormItems.carbs] as? String)!)
        newRecipe.fat = Int((formvalues[FormItems.fats] as? String)!)
        newRecipe.calories = Int((formvalues[FormItems.calories] as? String)!)
        newRecipe.mealType = meal
        newRecipe.image = "default.png"
        newRecipe.ingredients = [FoodItem]()
        newRecipe.totaltime = Int((formvalues[FormItems.totalminutes] as? String)!)
        newRecipe.ingredients = list //parseFood(str: ingredients.text!)
        MealPlanDao.saveMeal(forType: meal, meal: newRecipe)
        _ = navigationController?.popViewController(animated: true)
    
    
    }
    
    
}
