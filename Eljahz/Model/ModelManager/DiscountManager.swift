
//
//  DiscountManager.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/19/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class DiscountManager: NSObject {
    static let Manager = DiscountManager()
    
    
    
    func categoryManagerM(categoryID:String,Result:@escaping (_ result : Any)->()) {
        
      
        var discountArray = [ProductEntity]()
        let paramter = ["Start":"0","Length":"1000"] as [String:AnyObject]
     //   let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String

        let header:[String:String] = ["Content-Type" : "application/json","Authorization":User.userToken(),"X-Requested-With":"XMLHttpRequest"]
        RequestManager.Request.requestWithParameters(andURL: discount, Header: header,Meth: .get, Parparameters: nil ){ (data) in
            if let result = data as? JSON {
                
                
                for (key,subJson):(String, JSON) in result["data"] {
                    
                    let itemObject = ProductEntity ()
                   itemObject.id = subJson["product"]["id"].intValue.description
                   itemObject.nameAr = subJson["product"]["name_ar"].stringValue
                   itemObject.nameEn = subJson["product"]["name"].stringValue
                   itemObject.price = subJson["product"]["price"].intValue.description
                   itemObject.type = subJson["product"]["type"].intValue.description

                    
              
                    
                    discountArray.append(itemObject)
                }
                
                
                
                
                
                Result(discountArray)
            }
                
                
            else {
                Result(data as! String)
            }
            
            
        }
    }
    
    
}


