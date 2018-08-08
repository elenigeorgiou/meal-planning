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
import SplitRow

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
                row.title = "Carbs"
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
            
            <<< SwitchRow("switchRowTag") {
                $0.title = "Guide Me"
            }
            <<< PushRow<String>("leanProtein"){
                $0.hidden = Condition.function(["switchRowTag"], { form in
                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Choose a Lean Protein"
                $0.selectorTitle = "Choose a Lean Protein"
                $0.options = ["4 oz Chicken Breast","2 whole eggs","5 oz salmon", "2 slices turkey bacon", "5 oz cod", "1/2 cup black beans"]
                $0.value = "4 oz chicken breast"    // initially selected
            }
            <<< PushRow<String>("healthyCarb"){
                $0.hidden = Condition.function(["switchRowTag"], { form in
                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Choose a Whole Grain or Starch"
                $0.selectorTitle = "Choose a Whole Grain or Starch"
                $0.options = ["1/2 cup oats","1/2 cup sweet potato","1 slice whole grain bread"]
                $0.value = "1/2 cup sweet potato"    // initially selected
            }
            <<< PushRow<String>("veggies"){
                $0.hidden = Condition.function(["switchRowTag"], { form in
                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Choose Vegetables and Fruit"
                $0.selectorTitle = "Choose Vegetables and Fruit"
                $0.options = ["1 cup spinach","1 cup cucumber","1 tomato", "1/2 cup bell pepper", "1/2 cup berries", "1 whole apple", "1 banana", "1/2 cup mushrooms", "1 cup arugula"]
                $0.value = "1 cup spinach" //, "1/2 cup bell pepper">    // initially selected
            }
            <<< PushRow<String>("healthyFats"){
                $0.hidden = Condition.function(["switchRowTag"], { form in
                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Choose a Healthy Fat"
                $0.selectorTitle = "Choose a Healthy Fat"
                $0.options = ["1 tbsp almond butter","60 grams avocado","1 tbsp olive oil", "1 tbsp coconut oil"]
                $0.value = "60 grams avocado"    // initially selected
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
                                        return SplitRow<PushRow<String>, TextRow>("tag\(index+1)") {
                                                $0.rowLeft = PushRow<String>(){
                                                    $0.selectorTitle = "Category"
                                                    $0.value = "Pantry"
                                                    $0.options = ["Pantry","Produce","Dairy","Meat"]
                                                }
                                                $0.rowRight = TextRow(){
                                                    $0.placeholder = "Quantity Ingredient"
                                                }
                                        }
                                    }
                                    
//                                    $0 <<< SplitRow<PushRow<String>, TextRow>("tag1") {
//                                        $0.rowLeft = PushRow<String>(){
//                                            $0.selectorTitle = "Category"
//                                            $0.options = ["Pantry","Produce","Dairy","Meat"]
//                                            $0.value = "Pantry"
//                                        }
//                                        $0.rowRight = TextRow(){
//                                            $0.placeholder = "Quantity Ingredient"
//                                        }
//                                    }
                                    
                                    $0 <<< SplitRow<PushRow<String>, TextRow>("tagP") {
                                        $0.hidden = Condition.function(["switchRowTag"], { form in
                                            return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                                        })
                                        $0.rowLeft = PushRow<String>(){
                                            $0.selectorTitle = "Category"
                                            $0.options = ["Pantry","Produce","Dairy","Meat"]
                                            $0.value = "Meat"
                                        }
                                        $0.rowRight = TextRow(){
                                            $0.value = (form.rowBy(tag: "leanProtein") as? PushRow)?.value
                                    }
                                    }
                                    
                                    $0 <<< SplitRow<PushRow<String>, TextRow>("tagC") {
                                        $0.hidden = Condition.function(["switchRowTag"], { form in
                                            return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                                        })
                                        $0.rowLeft = PushRow<String>(){
                                            $0.selectorTitle = "Category"
                                            $0.options = ["Pantry","Produce","Dairy","Meat"]
                                            $0.value = "Produce"
                                        }
                                        $0.rowRight = TextRow(){
                                            $0.value = (form.rowBy(tag: "healthyCarb") as? PushRow)?.value
                                        }
                                    }
                                    
                                    $0 <<< SplitRow<PushRow<String>, TextRow>("tagF") {
                                        $0.hidden = Condition.function(["switchRowTag"], { form in
                                            return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                                        })
                                        $0.rowLeft = PushRow<String>(){
                                            $0.selectorTitle = "Category"
                                            $0.options = ["Pantry","Produce","Dairy","Meat"]
                                            $0.value = "Pantry"
                                        }
                                        $0.rowRight = TextRow(){
                                            $0.value = (form.rowBy(tag: "healthyFats") as? PushRow)?.value
                                        }
                                    }.cellUpdate { cell, row in
                                        
                                    }
                                    

                                    $0 <<< SplitRow<PushRow<String>, TextRow>("tagV") {
                                        $0.hidden = Condition.function(["switchRowTag"], { form in
                                            return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                                        })
                                        $0.rowLeft = PushRow<String>(){
                                            $0.selectorTitle = "Category"
                                            $0.options = ["Pantry","Produce","Dairy","Meat"]
                                            $0.value = "Produce"
                                        }
                                        $0.rowRight = TextRow(){
                                            $0.value = (form.rowBy(tag: "veggies") as? PushRow)?.value
                                        }
                                    }
                                    
                            
                                    
            }
            +++ Section("")
            
            <<< ButtonRow() { row in
                row.title = "Save"
                row.cell.tintColor = .white
                row.cell.backgroundColor = .gray
                row.cell.layer.cornerRadius = 2
                }.onCellSelection{cell,row in
                    self.save()
        }
        
    }
    
    func save() {
        let formvalues = self.form.values()
        // print(formvalues[FormItems.name] as! String)
      //  print(formvalues)
        let mealType = formvalues[FormItems.mealType] as? String
        var meal: Meal.MealType = Meal.MealType.Breakfast
        if mealType == "Breakfast" {
            meal = Meal.MealType.Breakfast
        } else if mealType == "Lunch"  {
            meal = Meal.MealType.Lunch
        } else {
            meal = Meal.MealType.Dinner
        }
        
        var list = [FoodItem]()
        let values : [SplitRowValue] = formvalues["ingredientsList"] as! [SplitRowValue<String, String>]
    
        for entry in values {
            let area :String = (entry.left as String?)!
            let text : String = (entry.right as String?)!
            var lineArr = text.lowercased().components(separatedBy: " ")
            let quantity = lineArr[0] + " " + lineArr[1]
            let areaType = area.lowercased() == "produce" ? FoodItem.FoodType.Produce : area.lowercased() == "dairy" ? FoodItem.FoodType.Dairy : area.lowercased() == "meat" || area.lowercased() == "fish" ? FoodItem.FoodType.Meat : FoodItem.FoodType.Pantry
            let food = lineArr[2..<lineArr.count].joined(separator: " ")
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
