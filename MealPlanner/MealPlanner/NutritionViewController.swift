//
//  NutritionViewController.swift
//  MealPlanner
//
//  Created by Eleni Georgiou on 6/29/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

import Foundation

import UIKit

class NutritionViewController: UIViewController, UICollectionViewDelegate {
   
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // collectionView = UICollectionView()
    //    super.view.addSubview(collectionView)
       
        //self.clearsSelectionOnViewWillAppear = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

