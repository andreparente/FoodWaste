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
        passwordTextField.secureTextEntry = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signUpAction(sender: UIButton) {
        performSegueWithIdentifier("LoginToRegisterViewController", sender: self)
    }
    
    @IBAction func loginAction(sender: UIButton) {
        

        if emailTxtField.text == "" || passwordTextField.text == "" {
            
            //alert dizendo que é preciso preencher todos os campos
               let alert = UIAlertController(title: "Warning", message: "You need to enter with email and password", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)

        alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            
            if self.validateEmail(emailTxtField.text!) {
                //fazer login verificando a senha
                
                // performSegueWithIdentifier("LoginToMainViewController", sender: self)
            } else {
                let alert = UIAlertController(title: "Warning", message: "your email is not correct", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(candidate)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
}

