//
//  RecipeViewController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 6/29/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit

class RecipeViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    var chosenMeals : Meal!
    var mealChosen : String = "" //default
    var ingredients: String = ""
    var selection: Int = 0
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var protein : String!
    var carbs : String!
    var fats : String!
    var cals : String!
    var ingredienttext : String!
    var instructionText : String!
    var instructionArray: [String] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recipe : String! = chosenMeals.name
        recipeLabel.text = recipe
        recipeLabel?.lineBreakMode = .byWordWrapping
        recipeLabel?.numberOfLines = 0
        
        protein  = String(chosenMeals.protein!)
        carbs = String(chosenMeals.carbs!)
        fats  = String(chosenMeals.fat!)
        cals  = String(chosenMeals.calories!)
        
        for ing in chosenMeals.ingredients!{
            ingredienttext = "\(ingredients) \(ing.quantity!)  \(ing.name!)\n"
        }
        
        instructionText = self.chosenMeals.instructions
        instructionText.enumerateLines { line, _ in
            self.instructionArray.append(line)
        }
        
        image.image = UIImage(named: chosenMeals.image!)
        
        self.view.addSubview(image)
        self.view.addSubview(recipeLabel);
        self.view.addSubview(tableView)
        
    }
    
    @IBAction func segementControlSwitch(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
            case 0:
                selection = 0
            case 1:
                selection = 1
            case 2:
                selection = 2
            default:
                break
           
        }
        tableView.reloadData()
        print(selection)
        self.view.addSubview(tableView)
    }
    
  //  @IBOutlet weak var cell: UITableViewCell!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
   func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
            if(selection == 0) {
                    return 4
            }
            else {
                    return 1
            }
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(selection == 0){
            return 1
        } else if(selection == 1) {
            return instructionArray.count
        } else {
            return chosenMeals.ingredients!.count
        }
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var header = ""
        if(selection == 0) {
            if (section == 0) {
                header = "Protein"
            }
            
            if (section == 1) {
                header = "Carbs"
            }
            
            if (section == 2) {
                header = "Fats"
            }
            if (section == 3) {
                header = "Calories"
            }
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.font = UIFont.init(name: "System", size: 12)
        if (selection == 0) {
            if (indexPath.section == 0) {
                cell.textLabel?.text = "\(protein!) grams"
            } else if(indexPath.section == 1) {
                cell.textLabel?.text = "\(carbs!) grams"
            } else if (indexPath.section == 2) {
                cell.textLabel?.text = "\(fats!) grams"
            }
            else {
                cell.textLabel?.text = "\(cals!) calories"
            }
        }
        
        if (selection == 1) {
            cell.textLabel?.text = instructionArray[indexPath.row]
            //self.chosenMeals.instructions
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.numberOfLines = 0
        }
        
        if (selection == 2) {
            let amount : String = (self.chosenMeals.ingredients?[indexPath.row].quantity)!
            let name : String = (self.chosenMeals.ingredients?[indexPath.row].name)!
            cell.textLabel?.text = "\(amount) \(name)"
        }
        
        return cell
    }
    
    
    
}
