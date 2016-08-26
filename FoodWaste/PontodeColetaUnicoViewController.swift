//
//  PontodeColetaUnicoViewController.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/24/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class PontodeColetaUnicoViewController: UIViewController{
    
    @IBOutlet weak var tablePremios: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var nomePonto: UILabel!
    @IBOutlet weak var imagePonto: UIImageView!
    var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        switch segment.selectedSegmentIndex
        {
        case 0:
            tablePremios.hidden = true
        case 1:
            tablePremios.hidden = true
        case 2:
            tablePremios.hidden = false
        default:
            break
        }
        nomePonto.text = places[index].title
        imagePonto.image = places[index].image
        // Do any additional setup after loading the view.
    }

    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
