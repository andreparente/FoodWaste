//
//  TableViewCellPontoUnico.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/26/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class TableViewCellPontoUnico: UITableViewCell {

    @IBOutlet weak var qtdPoints: UILabel!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
