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
    let instructionsData = ["Scrambled Egg Sandwich": "1.Scramble 1 egg in a pan coated with cooking spray \n2. Place egg between 2 slices 100% whole wheat bread \n3. Serve with 1/2 cup strawberries and black coffee", "Tuna Fish Melt Quesadilla"  : "1.In a bowl, combine tuna, mayonnaise, mustard and onion.\n2. Place a heavy bottom skillet over medium heat. \n3. Place tomato slices on one half of wrap. Spread tuna mixture over tomatoes and top with mozzarella (the other half of the wrap will have nothing on it). \n4. Fold wrap in half and brush with olive oil. \n5. Place wrap in pan and cook until golden brown, about 3 minutes. Flip and cook 2 more minutes. Serve. \n", "Herb-Crusted Salmon" : "1. Preheat oven to 425°.\n2. Season salmon with oil, 1⁄8 teaspoon salt and black pepper to taste.\n3. Place salmon on a sheet tray and top with herbs.\n4. In a medium bowl, thoroughly combine cracker crumbs, eggs and remaining 1⁄8 teaspoon salt and additional black pepper to taste.\n5. Place cracker crumb mixture on top of herbs and pat to make a crust.\n6. Place sheet tray in oven and bake until there is just a little bit of pink in the middle of the salmon, about 5 minutes depending on the thickness of the fish. Turn oven to broil and cook for an additional 2 minutes to brown crust, taking care not to burn. Serve with a wedge of lemon." ]
    let nutritionData = ["Scrambled Egg Sandwich" : ["protein": "10 g", "carbs":"34 g", "fat": "5 g", "calories":"250 kcal"], "Tuna Fish Melt Quesadilla" : ["protein": "44 g", "carbs":"29 g", "fat": "12 g", "calories":"405 kcal"], "Herb-Crusted Salmon" : ["protein": "29 g", "carbs":"14 g", "fat": "9 g", "calories":"253 kcal"]]
    let imageData = ["Scrambled Egg Sandwich" : "eggs.jpg", "Tuna Fish Melt Quesadilla": "tuna.jpg", "Herb-Crusted Salmon": "salmon.jpg"]
  //  let nutritionLabel = UILabel(accessibilityIdentifier:"nutrition")

    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
  
    @IBOutlet weak var instructionLabel: UITextView!
    
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
        image.image = UIImage(named: imageData[recipe]!)
        self.view.addSubview(image)
        self.view.addSubview(recipeLabel);
        self.view.addSubview(nutritionLabel)
        self.view.addSubview(instructionLabel)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
