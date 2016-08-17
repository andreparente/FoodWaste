//
//  Place.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/14/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation

public var places : [Place] = []

public class Place
{
    var title:String!
    var xCoord: Double!
    var yCoord: Double!
    
    init(title: String, x: Double, y: Double) {
        
        self.title = title
        self.xCoord = x
        self.yCoord = y
        
    }
}