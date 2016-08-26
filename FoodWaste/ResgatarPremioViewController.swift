//
//  ResgatarPremioViewController.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/26/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class ResgatarPremioViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var qtdPoints: UILabel!
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prizes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(prizes[indexPath.row].name)
        let cell = self.table.dequeueReusableCellWithIdentifier("cell1") as! TableViewCellPontoUnico
        cell.nameProduct.text = prizes[indexPath.row].name
        // cell.distance =
        cell.imageProduct.image = prizes[indexPath.row].image
        cell.qtdPoints.text = String(prizes[indexPath.row].qtdPoints)
        return cell
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
