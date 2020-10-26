//
//  Constant.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/17/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import Foundation
import Foundation
import UIKit

let LIGHTER_BROWN = 0xCC1D3A
let ALPHA_COMPONENT: CGFloat = 0.6
let LOADER_WIDTH: CGFloat = 50.0
func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
    
    
}
var applicationNumber = ""
let perpleColor = UIColor(displayP3Red: 242/255, green: 129/255, blue: 132/255, alpha: 1.0)
let grenColor = UIColor(displayP3Red: 36/255, green: 171/255, blue: 171/255, alpha: 1.0)
let baseUrl = "http://159.69.107.22/eljahz/public/index.php/api/auth/"
let login  = baseUrl + "login"
let category = baseUrl + "category/"
let discount  = baseUrl + "discounts"
let product = baseUrl + "products?self=1&type="
let addToCart = baseUrl + "cart/details"
let getCart = baseUrl + "cart"
