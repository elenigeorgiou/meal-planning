//
//  MealPlanTableTableViewController.swift
//  MealPlanner
//
//  Created by Vivek Rao on 6/20/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import UIKit

class MealPlanTableViewController: UITableViewController {
    
    var chosenMeals : [Meal] = [Meal]()
   
    
    var protein : IntegerLiteralType! = 0
    var carbs :IntegerLiteralType! = 0
    var fats : IntegerLiteralType! = 0
    var cals : IntegerLiteralType! = 0
    var goalprotein : IntegerLiteralType! = 66
    var goalcarbs :IntegerLiteralType! = 163
    var goalfats : IntegerLiteralType! = 39
    var goalcals : IntegerLiteralType! = 1250
    
    
    override func viewDidLoad() {
        if chosenMeals.isEmpty {
            chosenMeals = [MealPlanDao.getDefaultBreakfast(), MealPlanDao.getDefaultLunch(), MealPlanDao.getDefaultDinner()]
        }
        if chosenMeals[0].protein != nil {
            
        }
        protein = (chosenMeals[0].protein != nil ? chosenMeals[0].protein! : 0)
            + (chosenMeals[1].protein != nil ? chosenMeals[1].protein! : 0)
            + (chosenMeals[2].protein != nil ? chosenMeals[2].protein! : 0)
        carbs = (chosenMeals[0].carbs != nil ? chosenMeals[0].carbs! : 0)
            + (chosenMeals[1].carbs != nil ? chosenMeals[1].carbs! : 0)
            + (chosenMeals[2].carbs != nil ? chosenMeals[2].carbs! : 0)
        fats = (chosenMeals[0].fat != nil ? chosenMeals[0].fat! : 0)
            + (chosenMeals[1].fat != nil ? chosenMeals[1].fat! : 0)
            + (chosenMeals[2].fat != nil ? chosenMeals[2].fat! : 0)
        cals = (chosenMeals[0].calories != nil ? chosenMeals[0].calories! : 0)
            + (chosenMeals[1].calories != nil ? chosenMeals[1].calories! : 0)
            + (chosenMeals[2].calories != nil ? chosenMeals[2].calories! : 0)
//
//        
        self.clearsSelectionOnViewWillAppear = false
        super.viewDidLoad()
        print(chosenMeals)
       


        // Uncomment the following line to preserve selection between presentations
        

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 3) {
            return 4
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        // Configure the cell...
        if (indexPath.section == 0) {
            cell.textLabel?.text = chosenMeals[0].name //"Scrambled Egg Sandwich"
        }
        
        if (indexPath.section == 1) {
            cell.textLabel?.text = chosenMeals[1].name // "Tuna Fish Melt Quesadilla"
        }
        
        if (indexPath.section == 2) {
            cell.textLabel?.text = chosenMeals[2].name //"Herb-Crusted Salmon"
        }
        
        if (indexPath.section == 3) {
            cell.selectionStyle = .none
            if(indexPath.row == 0) {
                cell.textLabel?.text = "Protein: \t \(protein!) out of \(goalprotein!) grams"
            }
            if(indexPath.row == 1) {
                cell.textLabel?.text = "Fats: \t \(fats!) out of \(goalfats!) grams"
            }
            if(indexPath.row == 2) {
                cell.textLabel?.text = "Carbs: \t \(carbs!) out of \(goalcarbs!) grams"
            }
            if(indexPath.row == 3) {
                cell.textLabel?.text = "Calories: \t \(cals!) out of \(goalcals!) calories"
            }
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var mealType = ""
        
        if (section == 0) {
            mealType = "Breakfast"
        }
        
        if (section == 1) {
            mealType = "Lunch"
        }
        
        if (section == 2) {
            mealType = "Dinner"
        }
        if(section == 3) {
            mealType = "Nutrition Information"
        }
        
        return mealType
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeSegue" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                var text : String = ""
                if (indexPath.section == 0) {
                    text = chosenMeals[0].name!
                }
                
                if (indexPath.section == 1) {
                    text = chosenMeals[1].name!
                }
                
                if (indexPath.section == 2 || indexPath.section == 3) {
                    text = chosenMeals[2].name!
                }
                let controller = segue.destination as! RecipeViewController
                let chosemeal = text
                controller.mealChosen = chosemeal
            }
        }
        
        if segue.identifier == "GroceryListSegue" {
            let controller = segue.destination as! GroceriesTableViewController
            controller.chosenMeals = chosenMeals
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be e
     ditable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
