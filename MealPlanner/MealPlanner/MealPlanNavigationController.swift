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
    
     var chosenMeals : [Meal] = [Meal]()
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let controller = segue.destination as! MealPlanTableViewController
            controller.chosenMeals = chosenMeals
            self.navigationController?.pushViewController(controller, animated: true)
            print(chosenMeals)
    }
   
    
    
}
