//
//  User.swift
//  FoodWaste
//
//  Created by Andre Machado Parente on 8/12/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation

public var localUser: User!

public class User {
    
    var name: String!
    var email: String!
    var password: String!
    var points: Double!
    
    init(name: String, email: String, password: String, points: Double) {
        self.name = name
        self.email = email
        self.password = password
        self.points = points
    }
    
    init(email: String, password: String, points: Double) {
        self.email = email
        self.password = password
        self.points = points
    }
    
    func addPoints(points: Double) {
        self.points = self.points + points
    }
    
    func subtractPoints(points: Double) {
        
        if(self.points > points) {
            self.points = self.points - points
        } else {
            self.points = 0
        }
    }
}