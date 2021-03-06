//
//  RegisterViewController.swift
//  FoodWaste
//
//  Created by Andre Machado Parente on 8/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import TextFieldEffects
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   
    @IBOutlet weak var name: HoshiTextField!
    @IBOutlet weak var email: HoshiTextField!
    @IBOutlet weak var password: HoshiTextField!
    @IBOutlet weak var confirmPassword: HoshiTextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerAction(sender: UIButton) {
        
        FIRAuth.auth()?.createUserWithEmail(email.text!, password: password.text!, completion: {
            user,error in
            
            if error != nil {
                
                if error!.code == FIRAuthErrorCode.ErrorCodeEmailAlreadyInUse.rawValue {
                    
                    print(error!.code)
                    print(FIRAuthErrorCode.ErrorCodeEmailAlreadyInUse.rawValue)
                    print("email já está em uso!")
                    
                }
                    
                else if error!.code == FIRAuthErrorCode.ErrorCodeInvalidEmail.rawValue {
                    print(error!.code)
                    print(FIRAuthErrorCode.ErrorCodeInvalidEmail.rawValue)
                    print("o email inserido é invalido!")
                }
                    
                else if error!.code == FIRAuthErrorCode.ErrorCodeNetworkError.rawValue {
                    print(error!.code)
                    print(FIRAuthErrorCode.ErrorCodeNetworkError.rawValue)
                    print("Deu ruim na internet")
                }
                    
                else if error!.code == FIRAuthErrorCode.ErrorCodeWeakPassword.rawValue {
                    print(error!.code)
                    print(FIRAuthErrorCode.ErrorCodeNetworkError.rawValue)
                    print("senha fraca")
                }
            }
                
            else {
                print("CRIEI PORRA")
                globalUser = user
                
                localUser = User(name: self.name.text!, email: self.email.text!, password: self.password.text!, points: 0)
                
                Database().postUser()
                
                user!.sendEmailVerificationWithCompletion({ (error) in
                    
                })
                
                let alert = UIAlertController(title: "Warning", message: "You will receive an verification email, please verify your email to login!", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Ok!", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in self.dismissViewControllerAnimated(true, completion: nil)
                self.dismissViewControllerAnimated(true, completion: nil)})
                
                alert.addAction(alertAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })

    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPhotoAction(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.contentMode = .ScaleAspectFit
            profileImage.image = pickedImage
        }
        
       /*
         let imageURL = info[UIImagePickerControllerReferenceURL] as! NSURL
         let imageName = imageURL.path!
         let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as String
         let localPath = documentDirectory.URLByAppendingPathComponent(imageName)
         
         let image = info[UIImagePickerControllerOriginalImage] as! UIImage
         let data = UIImagePNGRepresentation(image)
         data.writeToFile(localPath, atomically: true)
         
         let imageData = NSData(contentsOfFile: localPath)!
         let photoURL = NSURL(fileURLWithPath: localPath)
         let imageWithData = UIImage(data: imageData)!
        */
        picker.dismissViewControllerAnimated(true, completion: nil)


    }

}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
