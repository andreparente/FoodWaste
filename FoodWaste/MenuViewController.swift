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

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPoints: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        places.removeAll()
        places.append(Place(title: "Spoleto", address: "Rua Nascimento Silva", image: UIImage(named: "spoletto")!))
        places.append(Place(title: "Vila Olímpica", address: "Rua Candido Benicio 3401", image: UIImage(named: "vilaOlimpica")!))
        places.append(Place(title: "Arena de Hockey", address: "Av. Duque de Caxias, 2020", image: UIImage(named: "arenaHockey")!))
        prizes.removeAll()
        prizes.append(Prize(name: "Refrigerante 300ml", image: UIImage(named:"refri")!, qtdPoints: 2))
        prizes.append(Prize(name: "Mini Tortinha", image: UIImage(named:"tortinha")!, qtdPoints: 2))
        prizes.append(Prize(name: "Chaveiro Rio 2016", image: UIImage(named:"chaveiro")!, qtdPoints: 5))
        prizes.append(Prize(name: "Pelúcia Vinícius", image: UIImage(named:"vinicius")!, qtdPoints: 15))
        print(prizes)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if defaults.boolForKey("Logged") {
            Database().retrieveUser(self)
            labelName.hidden = true
            labelPoints.hidden = true
            indicator.startAnimating()
        } 
        
        
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
        defaults.synchronize()
        do {
            
            try FIRAuth.auth()?.signOut()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("InitialViewController") as! InitialViewController
            self.presentViewController(vc, animated: true, completion: nil)
        } catch {
            print(error)
        }

    }
    @IBAction func pontosDeColeta(sender: AnyObject) {
        
        performSegueWithIdentifier("MainToPontosDeColeta", sender: self)
    }
}
