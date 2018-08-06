//
//  FormController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 8/6/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class FormUIController: UIViewController{
     override func viewDidLoad() {
         super.viewDidLoad()
    }
    
}

class MyFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form
            +++ Section("Section1")
                <<< TextRow(){ row in
                    row.title = "Recipe Name"
                    row.placeholder = "Enter text here"
                }
                <<< TextRow(){
                    $0.title = "Serving Size"
                    $0.placeholder = "And numbers here"
                }
                <<< TextRow(){
                    $0.title = "Calories"
                    $0.placeholder = "And numbers here"
                }
                <<< TextRow(){
                    $0.title = "Protein"
                    $0.placeholder = "And numbers here"
                }
            +++ Section("Section2")
                <<< DateRow(){
                    $0.title = "Date Row"
                    $0.value = Date(timeIntervalSinceReferenceDate: 0)
                }
                <<< AlertRow<String>() {
                    $0.title = "AlertRow"
                    $0.selectorTitle = "Pick Meal Type"
                    $0.options = ["Breakfast","Lunch","Dinner"]
                    $0.value = "Breakfast"    // initially selected
                }
            +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete],
                           header: "Multivalued TextField",
                           footer: ".Insert adds a 'Add Item' (Add New Tag) button row as last cell.") {
                            $0.addButtonProvider = { section in
                                return ButtonRow(){
                                    $0.title = "Add New Tag"
                                }
                            }
                            $0.multivaluedRowToInsertAt = { index in
                                return NameRow() {
                                    $0.placeholder = "Tag Name"
                                }
                            }
                            $0 <<< NameRow() {
                                $0.placeholder = "Tag Name"
                            }
        }
    }
}
