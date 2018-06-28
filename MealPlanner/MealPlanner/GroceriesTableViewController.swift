//
//  GroceriesTableViewController.swift
//  MealPlanner
//
//  Created by Vivek Rao on 6/20/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import UIKit

class GroceriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
      //   self.clearsSelectionOnViewWillAppear = false

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
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        if (section == 2) {
            return 4
        }
        if (section == 3) {
            return 2
        }
        if (section == 1) {
            return 5
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        if (indexPath.section == 0) {
            cell.textLabel?.text = "Egg - 6 - $3.99"
        }
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.textLabel?.text = "Mayonnaise - 1 jar - $4.99"
            }
            
            if (indexPath.row == 1) {
                cell.textLabel?.text = "Mustard - 1 jar - $4.99"
            }
            
            if (indexPath.row == 2) {
                cell.textLabel?.text = "Salt - 93 grams - $3.23"
            }
            
            if (indexPath.row == 3) {
                cell.textLabel?.text = "Pepper - 93 grams - $4.23"
            }
            
            if (indexPath.row == 4) {
                
            
                cell.textLabel?.text = "Whole Wheat Bread - 20 slices - $2.99"
            }
        }
        
        if (indexPath.section == 2) {
            if (indexPath.row == 0) {
                cell.textLabel?.text = "Strawberries - 500 grams - $2.99"
            }
            
            if (indexPath.row == 1) {
                cell.textLabel?.text = "Tomato - 1 - $0.53"
            }
            
            if (indexPath.row == 2) {
                cell.textLabel?.text = "Onion - 2 - $0.54"
            }
            
            if (indexPath.row == 3) {
                cell.textLabel?.text = "Spinach - 500 grams - $2.27"
            }
        }
        
        if (indexPath.section == 3) {
            if (indexPath.row == 0) {
                cell.textLabel?.text = "Tuna - 5 ounces - $2.99"
            }
            
            if (indexPath.row == 1) {
                cell.textLabel?.text = "Rotisserie Chicken - 1 - $5.27"
            }
        }
        
        if (indexPath.section == 4) {
           
        }
        if (indexPath.section == 4) {
            if (indexPath.row == 0) {
                cell.textLabel?.text = "Peanut Butter - 1 jar"
            }
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var mealType = ""
        
        if (section == 0) {
            mealType = "Dairy"
        }
        
        if (section == 1) {
            mealType = "Pantry"
        }
        
        if (section == 2) {
            mealType = "Produce"
        }
        
        if (section == 3) {
            mealType = "Meat"
        }
        
        if (section == 4) {
            mealType = "Have"
        }
        
        return mealType
    }
    
    //be able to check the boxes
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
        

    }

    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
