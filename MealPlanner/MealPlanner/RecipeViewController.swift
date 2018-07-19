//
//  RecipeViewController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 6/29/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit

class RecipeViewController : UIViewController {
    var chosenMeals : Meal = Meal()
    var mealChosen : String = "" //default
    var ingredients: String = ""
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
  
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var instructionLabel: UITextView!
    
    @IBOutlet weak var segmentLabel: UILabel!
    @IBAction func segementControlSwitch(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex{
            case 0:
            //textLabel.text = "First Segment Selected";
                segmentLabel.text = "Nutrition"
                self.view.addSubview(segmentLabel)
                let protein : String! = String(chosenMeals.protein!)
                let carbs : String! = String(chosenMeals.carbs!)
                let fats : String! = String(chosenMeals.fat!)
                let cals : String! = String(chosenMeals.calories!)
                instructionLabel.text = "Protein: \(protein!) grams \nCarbs: \(carbs!) grams \nFats: \(fats!) grams \nCalories: \(cals!) calories"
                self.view.addSubview(instructionLabel)
            case 1:
                segmentLabel.text = "Instructions"
                self.view.addSubview(segmentLabel)
                instructionLabel.text = chosenMeals.instructions
                self.view.addSubview(instructionLabel)
            case 2:
                segmentLabel.text = "Ingredients"
                self.view.addSubview(segmentLabel)
                instructionLabel.text = ingredients
                self.view.addSubview(instructionLabel)
            default:
            break
        }
    }
    
    @IBOutlet weak var nutritionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipe : String! = chosenMeals.name
        print(recipe)
        recipeLabel.text = recipe
        
        let  protein : String! = String(chosenMeals.protein!)
        let carbs : String! = String(chosenMeals.carbs!)
        let fats : String! = String(chosenMeals.fat!)
        let cals : String! = String(chosenMeals.calories!)
        instructionLabel.text = "Protein: \(protein!) grams \nCarbs: \(carbs!) grams \nFats: \(fats!) grams \nCalories: \(cals!) calories"
        for ing in chosenMeals.ingredients!{
            ingredients = "\(ingredients) \(ing.quantity!)  \(ing.name!)\n"
        }
        image.image = UIImage(named: chosenMeals.image!)
        self.view.addSubview(image)
        self.view.addSubview(recipeLabel);
        self.view.addSubview(instructionLabel)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
