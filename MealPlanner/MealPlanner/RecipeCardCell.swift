//
//  RecipeCardCell.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 8/7/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit

class RecipeCardCell : UITableViewCell {
   
    
    @IBOutlet weak var mealTypeLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var nutritionInfoLabel: UILabel!
    @IBOutlet var imageLabel: UIImageView!
    
    
   
}

class NutritionCardCell : UITableViewCell {
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
}
