//
//  AfterCodeViewController.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/28/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class AfterCodeViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "You won 2 points!"
        points += 2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
