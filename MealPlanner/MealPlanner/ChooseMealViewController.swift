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
    let breakfast = MealPlanDao.getBreakfastOptions()
    let lunch = MealPlanDao.getLunchOptions()
    let dinner = MealPlanDao.getDinnerOptions()
    
    override func viewDidLoad() {
        
        self.clearsSelectionOnViewWillAppear = false
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
            cell.textLabel?.text = self.breakfast[indexPath.row].name
        }
        
        if (indexPath.section == 1) {
            cell.textLabel?.text = self.lunch[indexPath.row].name
        }
        
        if (indexPath.section == 2) {
            cell.textLabel?.text = self.dinner[indexPath.row].name
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
    var breakfastMeal:String = ""
    var lunchMeal:String = ""
    var dinnerMeal:String = ""
    var mealsChosen = ["","",""]
   
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        tableView.allowsMultipleSelection = true
        if indexPath.section == 0 {
            breakfastMeal = self.breakfast[indexPath.row].name!
        }
        if indexPath.section == 1 {
            lunchMeal = self.lunch[indexPath.row].name!
        }
        if indexPath.section == 2 {
            dinnerMeal = self.dinner[indexPath.row].name!
        }
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            for selectedIndexPath in selectedIndexPaths {
                if selectedIndexPath.section == indexPath.section {
                    tableView.deselectRow(at: selectedIndexPath, animated: true)
                }
            }
        }
        
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         mealsChosen = [breakfastMeal, lunchMeal, dinnerMeal]
     //   if segue.identifier == "CreateMealPlanSegue" {
                let controller = segue.destination as! MealPlanNavigationController
           //     let controller2 = segue.destination as! MealPlanTableViewController
                print(mealsChosen)
                controller.chosenMeals = mealsChosen
                let mealView = controller.viewControllers.first as! MealPlanTableViewController
                mealView.chosenMeals = mealsChosen
        // self.navigationController?.pushViewController(controller, animated: true)
              //  controller2.chosenMeals = mealsChosen
          //  }
        
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
