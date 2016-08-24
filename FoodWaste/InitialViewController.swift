//
//  InitialViewController.swift
//  FoodWaste
//
//  Created by Gabriella Lopes on 8/23/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToLoginAction(sender: AnyObject) {
        performSegueWithIdentifier("goToLogin", sender: self)
    }
    
    
    @IBAction func goToRegisterAction(sender: AnyObject) {
        performSegueWithIdentifier("goToRegister", sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}