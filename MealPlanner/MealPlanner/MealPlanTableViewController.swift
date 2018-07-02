//
//  MealPlanTableTableViewController.swift
//  MealPlanner
//
//  Created by Vivek Rao on 6/20/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import UIKit

class MealPlanTableViewController: UITableViewController {
    
    
    var chosenMeals : [String] = ["Scrambled Egg Sandwich","Tuna Fish Melt Quesadilla","Herb-Crusted Salmon"]
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        // Configure the cell...
        if (indexPath.section == 0) {
            cell.textLabel?.text = chosenMeals[0] //"Scrambled Egg Sandwich"
        }
        
        if (indexPath.section == 1) {
            cell.textLabel?.text = chosenMeals[1] // "Tuna Fish Melt Quesadilla"
        }
        
        if (indexPath.section == 2) {
            cell.textLabel?.text = chosenMeals[2] //"Herb-Crusted Salmon"
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
        
        return mealType
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeSegue" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                var text : String = ""
                if (indexPath.section == 0) {
                    text = "Scrambled Egg Sandwich"
                }
                
                if (indexPath.section == 1) {
                    text = "Tuna Fish Melt Quesadilla"
                }
                
                if (indexPath.section == 2) {
                    text = "Herb-Crusted Salmon"
                }
                let controller = segue.destination as! RecipeViewController
                let chosemeal = text
                controller.mealChosen = chosemeal
            }
           
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
