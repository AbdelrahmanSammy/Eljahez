
//
//  CartManager.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/22/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CartManager: NSObject {
    static let Manager = CartManager()
    
    
    
    func CartManagerM(Result:@escaping (_ result : Any)->()) {
        
      
        var cartArray = [CartEntity]()
     //   let paramter = ["Start":"0","Length":"1000"] as [String:AnyObject]
     //   let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String

        let header:[String:String] = ["Content-Type" : "application/json","Authorization":User.userToken(),"X-Requested-With":"XMLHttpRequest"]
      
        RequestManager.Request.requestWithParameters(andURL: getCart, Header: header,Meth: .get, Parparameters: nil ){ (data) in
            if let result = data as? JSON {
                for (key,subJson):(String, JSON) in result["data"]["details"] {
                        let prodectObject = CartEntity ()
                    prodectObject.quantity = subJson["quantity"].intValue.description
                   
                    for (key,filterJson):(String, JSON) in subJson["product_categories"]  {
                        let filterObject = FilterEntity ()
                        filterObject.id = filterJson["id"].intValue.description
                        filterObject.nameAr = filterJson["category"]["name_ar"].stringValue
                        filterObject.nameEn = filterJson["category"]["name"].stringValue
                        filterObject.parentID = filterJson["category"]["parent_id"].intValue.description
                        filterObject.price = filterJson["category"]["price"].intValue.description
                        filterObject.type = filterJson["category"]["type"].intValue.description
                        prodectObject.filterArray.append(filterObject)
                    }
                    cartArray.append(prodectObject)
                }

                Result(cartArray)
            }
                
                
            else {
                Result(data as! String)
            }
            
            
        }
    }
    
    
}


