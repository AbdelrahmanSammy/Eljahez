//
//  CategoryManager.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/19/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CategoryManager: NSObject {
    static let Manager = CategoryManager()
    
    
    
    func categoryManagerM(categoryID:String,Result:@escaping (_ result : Any)->()) {
        
      
        var categoryArray = [CategoryEntity]()
        let paramter = ["Start":"0","Length":"1000"] as [String:AnyObject]
     //   let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String

        let header:[String:String] = ["Content-Type" : "application/json","Authorization":User.userToken(),"X-Requested-With":"XMLHttpRequest"]
        let url = category + categoryID
        RequestManager.Request.requestWithParameters(andURL: url, Header: header,Meth: .get, Parparameters: nil ){ (data) in
            if let result = data as? JSON {
                
                
                for (key,subJson):(String, JSON) in result["data"] {
                    let itemObject = CategoryEntity ()
                    itemObject.id  =   subJson["id"].intValue.description
                    itemObject.nameAr =  subJson["name_ar"].stringValue
                    itemObject.nameEn = subJson["name"].stringValue

                    
               /////////////////////get Products Array
                    for (key,productJson):(String, JSON) in subJson["products"]  {
                        let prodectObject = ProductEntity ()
                        
                        prodectObject.id = productJson["id"].intValue.description
                        prodectObject.nameAr = productJson["name_ar"].stringValue
                        prodectObject.nameEn = productJson["name"].stringValue
                        prodectObject.price = productJson["price"].intValue.description
                        prodectObject.type = productJson["type"].intValue.description
                        itemObject.products.append(prodectObject)
                        
                        
                    }
                     /////////////////////get SubCategory Array
                    for (key,subCategoryJson):(String, JSON) in subJson["subcategory"]  {
                                  let subCategoryObject = FilterEntity ()
                                  
                                  subCategoryObject.id = subCategoryJson["id"].intValue.description
                                  subCategoryObject.nameAr = subCategoryJson["name_ar"].stringValue
                                  subCategoryObject.nameEn = subCategoryJson["name"].stringValue
                                  subCategoryObject.price = subCategoryJson["price"].intValue.description
                                  subCategoryObject.type = subCategoryJson["type"].intValue.description
                                  subCategoryObject.parentID = subCategoryJson["parent_id"].intValue.description
                                  itemObject.subCategory.append(subCategoryObject)
                              
                                  
                              }
                    
                    categoryArray.append(itemObject)
                }
                
                
                
                
                
                Result(categoryArray)
            }
                
                
            else {
                Result(data as! String)
            }
            
            
        }
    }
    
    
}


