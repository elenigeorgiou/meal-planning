//
//  Hero.swift
//  MealPlanner
//
//  Created by Vivek Rao on 6/19/18.
//  Copyright © 2018 Eleni Georgiou. All rights reserved.
//

class Hero {
    var id: Int
    var name: String?
    var powerRanking: Int
    
    init(id: Int, name: String?, powerRanking: Int){
        self.id = id
        self.name = name
        self.powerRanking = powerRanking
    }
}
