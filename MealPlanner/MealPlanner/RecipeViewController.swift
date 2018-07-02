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
    
    var mealChosen : String = "" //default
    let instructionsData = ["Scrambled Egg Sandwich": "1. Flip the egg and you're done \n2. Put some toppings", "Tuna Fish Melt Quesadilla"  : "1. made it", "Dinner Rotisserie Chicken Salad" : "2 3 " ]
    let nutritionData = ["Scrambled Egg Sandwich" : ["protein": "45 g", "carbs":"70 g", "fat": "20 g", "calories":"598 kcal"], "Tuna Fish Melt Quesadilla" : ["protein": "45 g", "carbs":"40 g", "fat": "10 g", "calories":"300 kcal"], "Dinner Rotisserie Chicken Salad" : ["protein": "55 g", "carbs":"32 g", "fat": "14 g", "calories":"356 kcal"]]
    let imageData = ["Scrambled Egg Sandwich" : "eggs.jpg", "Tuna Fish Melt Quesadilla": "tuna.jpg", "Dinner Rotisserie Chicken Salad": "chicken.jpg"]
  //  let nutritionLabel = UILabel(accessibilityIdentifier:"nutrition")

    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var nutritionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipe : String! = mealChosen
        print(recipe)
        recipeLabel.text = recipe
        instructionLabel.text = instructionsData[recipe]
        let  protein : String! = nutritionData[recipe]!["protein"]
        let carbs : String! = nutritionData[recipe]!["carbs"]
        let fats : String! = nutritionData[recipe]!["fat"]
        let cals : String! = nutritionData[recipe]!["calories"]
        nutritionLabel.text = "Protein: \(protein!) \nCarbs: \(carbs!) \nFats: \(fats!) \nCalories: \(cals!)"
        image.image = UIImage(named: "eggs.jpg")
        self.view.addSubview(image)
        self.view.addSubview(recipeLabel);
        self.view.addSubview(nutritionLabel)
        self.view.addSubview(instructionLabel)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
