//
//  MealPlanNavigationController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 7/2/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit

class MealPlanNavigationController : UINavigationController {
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let controller = segue.destination as! MealPlanTableViewController
            controller.chosenMeals = chosenMeals
            print(chosenMeals)
    }
    var chosenMeals : [String] = ["Scrambled Egg Sandwich","Tuna Fish Melt Quesadilla","Herb-Crusted Salmon"]
    
    
}
