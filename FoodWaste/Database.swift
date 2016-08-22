//
//  Database.swift
//  FoodWaste
//
//  Created by Andre Machado Parente on 8/17/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


public class Database {
    
    func postPlace(/*something to post*/ placeTitle: String, xCoord: Double, yCoord: Double) {
        
        let postPlace : [String : AnyObject] = ["name" : placeTitle, "x" : xCoord, "y" : yCoord]
        
        let dataBaseRef = FIRDatabase.database().reference()
        
        dataBaseRef.child("Places").childByAutoId().setValue(postPlace)
        
        
        
    }
    
    func retrievePlaces() {
        
        let dataBaseRef = FIRDatabase.database().reference()
        
        dataBaseRef.child("Places").queryOrderedByKey().observeEventType(.ChildAdded, withBlock: {
        snapshot in
            
            let name = snapshot.value!["name"] as! String
            let xCoord = snapshot.value!["x"] as! Double
            let yCoord = snapshot.value!["y"] as! Double
            
            places.append(Place(title: name, x: xCoord, y: yCoord))
            
        })
    }
    
    func postUser() {
        
        
        let postUser : [String : AnyObject] = ["name" : localUser.name, "email" : localUser.email, "password" : localUser.password, "points" : localUser.points]
        
        let dataBaseRef = FIRDatabase.database().reference()
        
        dataBaseRef.child("Users").child(globalUser!.uid).setValue(postUser)

        
    }
    
    func retrieveUser(vc: MenuViewController) {
        
        let dataBaseRef = FIRDatabase.database().reference()

        
        dataBaseRef.child("Users").child(globalUser.uid).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            
            // Get user value
            let points = snapshot.value!["points"] as! Double
            let name = snapshot.value!["name"] as! String
            let password = snapshot.value!["password"] as! String
            
            localUser = User(email: globalUser.email!, password: password, points: 0)
            localUser.points = points
            localUser.name = name
            
            //e aqui carrega a pagina!!
            print(localUser.name)
            print(localUser.password)
            print(localUser.email)
            
            vc.labelName.text = localUser.name
            vc.labelPoints.text = "\(localUser.points) points"
            
            vc.labelName.hidden = false
            vc.labelPoints.hidden = false
            vc.indicator.stopAnimating()
            vc.indicator.hidden = true
            

        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}