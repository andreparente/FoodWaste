//
//  HelpViewController.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/24/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var index:Int!
    
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
        return 2
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        index = indexPath.row
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCellWithIdentifier("cell2") as! HelpCell
        switch indexPath.row
        {
        case 0:
            cell.titleLabel.text = "How can I win points?"
        case 1:
            cell.titleLabel.text = "How much my donation is worth?"
        default:
            break
        }
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

public class HelpCell:UITableViewCell
{
    @IBOutlet weak var titleLabel:UILabel!
}
