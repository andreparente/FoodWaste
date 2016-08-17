//
//  MenuViewController.swift
//  FoodWaste
//
//  Created by Gabriella Lopes on 8/13/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        Database().retrieveUser()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logOutAction(sender: UIButton) {
        defaults.setBool(false, forKey: "Logged")
        defaults.setBool(true, forKey: "deslogou")
        do {
            
            try FIRAuth.auth()?.signOut()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            self.presentViewController(vc, animated: true, completion: nil)
        } catch {
            print(error)
        }

    }
}
