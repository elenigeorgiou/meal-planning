//
//  GroceriesTableViewController.swift
//  MealPlanner
//
//  Created by Vivek Rao on 6/20/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import UIKit

class GroceriesTableViewController: UITableViewController {

    var haveList : [String] = ["Peanut Butter - 1 jar"]
    var produceList : [String] = ["Strawberries - 500 grams - $2.99","Onion - 2 - $0.54", "Spinach - 500 grams - $2.27"]
    var meatList : [String] = ["Tuna - 5 ounces - $2.99","Rotisserie Chicken - 1 - $5.27"]
    var pantryList : [String] = ["Mayonnaise - 1 jar - $4.99", "Mustard - 1 jar - $4.99", "Salt - 93 grams - $3.23", "Pepper - 93 grams - $4.23", "Whole Wheat Bread - 20 slices - $2.99"]
    var dairyList : [String] = ["Egg - 6 - $3.99"]
    
    var checkedOff : [String : Bool] = [:]
    
    var chosenMeals = ["","",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up grocery list 
        
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
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        if (section == 0) {
            return dairyList.count
        }
        if (section == 1) {
            return produceList.count
        }
        if (section == 2) {
            return meatList.count
        }
        if (section == 3) {
            return pantryList.count
        }
        if (section == 4) {
            return haveList.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let dairyColor = UIColor(red: 101, green: 170, blue: 247, alpha: 0.9)
        let produceColor = UIColor(red: 101, green: 170, blue: 247, alpha: 0.6)
        let pantryColor = UIColor(red: 101, green: 170, blue: 247, alpha: 0.6)
        let meatColor = UIColor(red: 101, green: 170, blue: 247, alpha: 0.6)
        let haveColor = UIColor(red: 101, green: 170, blue: 247, alpha: 0.6)
        // Configure the cell...
        if (indexPath.section == 0) {
            let text = dairyList[indexPath.row]
            cell.textLabel?.text = text
            cell.contentView.backgroundColor = dairyColor
    
        }
        
        if (indexPath.section == 1) {
            //cell.backgroundColor = UIColor.green
            cell.textLabel?.text = produceList[indexPath.row]
            cell.contentView.backgroundColor = produceColor
        }
        
        if (indexPath.section == 2) {
         //   cell.backgroundColor = [UIColor .purple]
            cell.textLabel?.text = meatList[indexPath.row]
             cell.contentView.backgroundColor = meatColor
        }
        
        if (indexPath.section == 3) {
          //  cell.backgroundColor = [UIColor .red]
            cell.textLabel?.text = pantryList[indexPath.row]
             cell.contentView.backgroundColor = pantryColor
        }
        
        if (indexPath.section == 4) {
        //    cell.backgroundColor = [UIColor .yellow]
              cell.textLabel?.text = haveList[indexPath.row]
             cell.contentView.backgroundColor = haveColor
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var mealType = ""
        
        if (section == 0) {
            mealType = "Dairy"
        }
        
        if (section == 1) {
            mealType = "Produce"
        }
        
        if (section == 2) {
            mealType = "Meat"
        }
        
        if (section == 3) {
            mealType = "Pantry"
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
                checkedOff[(cell.textLabel?.text)!] = false
            } else {
                cell.accessoryType = .checkmark
                checkedOff[(cell.textLabel?.text)!] = true
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
