//
//  ViewController.swift
//  FoodWaste
//
//  Created by Andre Machado Parente on 8/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import TextFieldEffects


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxtField: HoshiTextField!
    
    @IBOutlet weak var passwordTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func signUpAction(sender: UIButton) {
        performSegueWithIdentifier("LoginToRegisterViewController", sender: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
}

