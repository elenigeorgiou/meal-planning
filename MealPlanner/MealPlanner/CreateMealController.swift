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
    
    var pickerData : [String] = []
    override func viewDidLoad(){
        super.viewDidLoad()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //save all data fields into Meal Dao!!!
        let newRecipe: Meal = Meal()
        newRecipe.name = recipeName.text!
        newRecipe.instructions = instructions.text!
        newRecipe.protein = Int(protein.text!)
        newRecipe.carbs = Int(carbs.text!)
        newRecipe.fat = Int(fats.text!)
        newRecipe.calories = Int(calories.text!)
        newRecipe.mealType = meal
        newRecipe.image = "default.png"
        newRecipe.totaltime = Int(totalmin.text!)
        newRecipe.ingredients = [FoodItem]()
        MealPlanDao.saveMeal(forType: meal, meal: newRecipe)
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
    

