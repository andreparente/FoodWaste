//
//  Prize.swift
//  FoodWaste
//
//  Created by Felipe Viberti on 8/26/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import UIKit
public var prizes : [Prize] = []

public class Prize
{
    var name:String!
    var image:UIImage!
    var qtdPoints:Int!
    
    init(name:String,image:UIImage,qtdPoints:Int)
    {
        self.name = name
        self.image = image
        self.qtdPoints = qtdPoints
    }
}