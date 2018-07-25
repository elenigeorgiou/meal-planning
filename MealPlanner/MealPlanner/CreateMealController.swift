//
//  CreateMealController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 7/20/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit

class CreateMealController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    
    var meal: Meal.MealType = Meal.MealType.Breakfast
    var chosenMeals : [Meal] = [Meal]()
    @IBOutlet var recipeName: UITextField!
    @IBOutlet var protein: UITextField!
    @IBOutlet var carbs: UITextField!
    @IBOutlet var fats: UITextField!
    @IBOutlet var calories: UITextField!
    @IBOutlet var mealType: UIPickerView!
    @IBOutlet var totalmin: UITextField!
    @IBOutlet var servings: UITextField!
    @IBOutlet var instructions: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var ingredients: UITextView!
    
    var pickerData : [String] = []
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addSubview(saveButton)
        mealType.delegate = self as UIPickerViewDelegate
        mealType.dataSource = self as UIPickerViewDataSource
        pickerData = ["Breakfast", "Lunch", "Dinner"]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
  
    @IBAction func buttonClick(sender: UIButton) {
        //save all data fields into Meal Dao!!!
        
        let newRecipe:Meal = Meal()
        newRecipe.name = recipeName.text!
        newRecipe.instructions = instructions.text!
        newRecipe.protein = Int(protein.text!)
        newRecipe.carbs = Int(carbs.text!)
        newRecipe.fat = Int(fats.text!)
        newRecipe.calories = Int(calories.text!)
        newRecipe.mealType = meal
        newRecipe.image = "default.png"
        newRecipe.totaltime = Int(totalmin.text!)
        newRecipe.ingredients = parseFood(str: ingredients.text!)
        
        MealPlanDao.saveMeal(forType: meal, meal: newRecipe)
    }
    
    @IBOutlet weak var saved: UILabel!
    
    func parseFood(str: String) -> [FoodItem] {
        var list = [FoodItem]()
        var lines: [String] = []
        str.enumerateLines { line, _ in
            lines.append(line)
        }
        for line in lines {
            var lineArr = line.components(separatedBy: " ")
            let quantity = lineArr[0] + " " + lineArr[1]
            let area = lineArr[2]
            let areaType = area.lowercased() == "produce" ? FoodItem.FoodType.Produce : area.lowercased() == "dairy" ? FoodItem.FoodType.Dairy : area.lowercased() == "meat" || area.lowercased() == "fish" ? FoodItem.FoodType.Meat : FoodItem.FoodType.Pantry
            lineArr.remove(at: 0)
            lineArr.remove(at: 0)
            lineArr.remove(at: 0)
            let food = lineArr.joined(separator: " ")
            let item = FoodItem(name: food, price: 0.00, quantity: quantity, foodType: areaType)
            list.insert(item, at: 0)
        }
        saved.text  = "Saved"
        self.view.addSubview(saved)
        return list
    
    }
    
    func pickerView(_ picker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            meal = Meal.MealType.Breakfast
        } else if row == 1 {
            meal = Meal.MealType.Lunch
        } else {
            meal = Meal.MealType.Dinner
        }
    }
}
    

