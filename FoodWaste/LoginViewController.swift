//
//  ViewController.swift
//  FoodWaste
//
//  Created by Andre Machado Parente on 8/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import TextFieldEffects
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: HoshiTextField!
    
    @IBOutlet weak var passwordTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.secureTextEntry = true
        passwordTextField.delegate = self
        emailTxtField.delegate = self
        
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
        

        if emailTxtField.text!.isEmpty || passwordTextField.text!.isEmpty {
            
            //alert dizendo que é preciso preencher todos os campos
               let alert = UIAlertController(title: "Warning", message: "You need to enter with email and password", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)

        alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            
            if self.validateEmail(emailTxtField.text!) {
                
                //fazer login verificando a senha
                FIRAuth.auth()?.signInWithEmail(emailTxtField.text!, password: passwordTextField.text!, completion: {
                    user, error in
                    
                    if error != nil {
                        
                        


                        if error!.code == FIRAuthErrorCode.ErrorCodeWrongPassword.rawValue {
                            
                            print(error!.code)
                            print(FIRAuthErrorCode.ErrorCodeWrongPassword.rawValue)
                            let alert = UIAlertController(title: "Warning", message: "Incorrect Password", preferredStyle: UIAlertControllerStyle.Alert)
                            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                            
                            alert.addAction(alertAction)
                            self.presentViewController(alert, animated: true, completion: nil)

                            print("senha incorreta")
                            
                        }
                            
                        else if error!.code == FIRAuthErrorCode.ErrorCodeNetworkError.rawValue {
                            print(error!.code)
                            print(FIRAuthErrorCode.ErrorCodeNetworkError.rawValue)
                            print("Deu ruim na internet")
                        } else {
                            
                            let alert = UIAlertController(title: "Error", message: "Email not registered", preferredStyle: UIAlertControllerStyle.Alert)
                            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                            
                            alert.addAction(alertAction)
                            self.presentViewController(alert, animated: true, completion: nil)
                        }
                        
                    }
                        
                    else {
                        
                        globalUser = user
                  
                        if (globalUser!.emailVerified) {
                            print("LOGOU USER EMAIL VERIFICADO")
                            
                            localUser = User(email: self.emailTxtField.text!, password: self.passwordTextField.text!, points: 0)
                                
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! MenuViewController
                            
                            self.presentViewController(vc, animated: true, completion: nil)

                            defaults.setBool(true, forKey: "Logged")
                            defaults.synchronize()
                        }
                        else {
                            let alert = UIAlertController(title: "Warning", message: "Please verify your email!", preferredStyle: UIAlertControllerStyle.Alert)
                            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                            
                            alert.addAction(alertAction)
                            self.presentViewController(alert, animated: true, completion: nil)
                        }
                    }
                })
                
                
            } else {
                let alert = UIAlertController(title: "Warning", message: "your email is not correct", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        
        
        // __________________ ------------------------------------ ______________________
        
        

    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(candidate)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
