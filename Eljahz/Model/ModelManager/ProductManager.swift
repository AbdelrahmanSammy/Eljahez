//
//  ProductManager.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/21/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ProductManager: NSObject {
    static let Manager = ProductManager()
    
    
    
    func ProductManagerM(productID:String,Result:@escaping (_ result : Any)->()) {
        
      
        var productsArray = [ProductEntity]()
        let paramter = ["Start":"0","Length":"1000"] as [String:AnyObject]
     //   let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String

        let header:[String:String] = ["Content-Type" : "application/json","Authorization":User.userToken(),"X-Requested-With":"XMLHttpRequest"]
        let url = product + productID
        RequestManager.Request.requestWithParameters(andURL: url, Header: header,Meth: .get, Parparameters: nil ){ (data) in
            if let result = data as? JSON {
                for (key,subJson):(String, JSON) in result["data"] {
                        let prodectObject = ProductEntity ()
                        prodectObject.id = subJson["id"].intValue.description
                        prodectObject.nameAr = subJson["name_ar"].stringValue
                        prodectObject.nameEn = subJson["name"].stringValue
                        prodectObject.price = subJson["price"].intValue.description
                        prodectObject.type = subJson["type"].intValue.description
                    prodectObject.image = subJson["media"][0]["file_name"].stringValue

                    productsArray.append(prodectObject)
                }

                Result(productsArray)
            }
                
                
            else {
                Result(data as! String)
            }
            
            
        }
    }
    
    
}


