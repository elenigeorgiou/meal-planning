//
//  ChooseMealsViewController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 6/27/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit

class ChooseMealsController: UITableViewController {
    let breakfast = [
        "Scrambled Egg Sandwich",
        "Canadian Bacon Pocket with Egg, Tomato and Lettuce",
        "English Muffin with Peanut Butter",
        "Yogurt, Oats, and Raspberries"
    ]
    let lunch = [
        "Tuna Fish Melt Quesadilla",
        "Chicken Waldorf Salad",
        "White Bean and Spinach Soup",
        "Chickpea Salad",
        "Minestrone Soup"
      
    ]
    
    let dinner = [
       "Broiled Shrimp with Lemon, Garlic and Spinach",
        "Dinner Rotisserie Chicken Salad",
        "Herb-Crusted Salmon",
          "Chicken Parm Sub",
          "Grilled Chicken"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.clearsSelectionOnViewWillAppear = false
        
        // Do any additional setup after loading the view.
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
        if (section == 0) {
            return breakfast.count
        }
        if (section == 1) {
            return lunch.count
        }
        if (section == 2) {
            return dinner.count
        }
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        //the right arrow
        
        // Configure the cell...
        if (indexPath.section == 0) {
            cell.textLabel?.text = self.breakfast[indexPath.row]
        }
        
        if (indexPath.section == 1) {
            cell.textLabel?.text = self.lunch[indexPath.row]
        }
        
        if (indexPath.section == 2) {
            cell.textLabel?.text = self.dinner[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var mealType = ""
        
        if (section == 0) {
            mealType = "Breakfast Day 1"
        }
        
        if (section == 1) {
            mealType = "Lunch Day 1"
        }
        
        if (section == 2) {
            mealType = "Dinner Day 1"
        }
        
        return mealType
    }
    
    //be able to check the boxes
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
//            if cell.accessoryType == .checkmark {
//                cell.accessoryType = .none
//                //right arrow
//               // cell.accessoryType = .disclosureIndicator
//            } else {
//                //selected
//                cell.accessoryType = .checkmark
//            }
//        }
//
//
//    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        tableView.allowsMultipleSelection = true
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            for selectedIndexPath in selectedIndexPaths {
                if selectedIndexPath.section == indexPath.section {
                    tableView.deselectRow(at: selectedIndexPath, animated: true)
                }
            }
        }
        return indexPath
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //
    //    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return 2
    //    }
    //
    //    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    //        return 60
    //    }
    //
    //
    //    // MARK: UIPickerViewDelegate
    //
    //    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
    //
    //        let myView = UIView()
    //        let myImageView = UIImageView()
    //
    //        var rowString = String()
    //        switch row {
    //        case 0:
    //            rowString = "Buttermilk Pancakes"
    //            myImageView.image = UIImage(named:"pancakes.jpg")
    //        case 1:
    //            rowString = "Scrambled Eggs"
    //            myImageView.image = UIImage(named:"eggs.jpg")
    //        default:
    //            rowString = "Error: too many rows"
    //            myImageView.image = nil
    //        }
    //        let myLabel = UILabel()
    //        myLabel.text = rowString
    //
    //        myView.addSubview(myLabel)
    //        myView.addSubview(myImageView)
    //
    //        return myView
    //    }
    //
    //    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //
    //        // do something with selected row
    //    }
    //
    
}
