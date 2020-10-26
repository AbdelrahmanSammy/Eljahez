//
//  AddToCartManager.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/22/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON
class AddToCartManager: NSObject {
    static let Manager = AddToCartManager()
    //  var resultObject:AnyObject? = nil
    func AddToCartManagerm (cartParameter: [String : AnyObject],Result:@escaping (_ result : Any)->() ) {
//        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
     let header:[String:String] = ["Content-Type" : "application/json","Authorization":User.userToken(),"X-Requested-With":"XMLHttpRequest"]
        
        RequestManager.Request.requestWithParameters(andURL: addToCart, Header: header, Meth: .post, Parparameters: cartParameter ){ (data) in
            if let result = data as? JSON {
//                let itemObject = LoginEntity ()
//                itemObject.id = result["result"]["profile"]["userId"].stringValue
//                itemObject.first_name = result["result"]["profile"]["name"].stringValue
//                itemObject.city = result["result"]["profile"]["cityName"].stringValue
//                itemObject.country = result["result"]["profile"]["countryName"].stringValue
//                itemObject.gender = result["result"]["profile"]["genderText"].stringValue
//                itemObject.profile_picture = result["result"]["profile"]["avatarUrl"].stringValue
//                itemObject.access_token = result["result"]["accessToken"].stringValue
//                
//                User.setuserName(userName: itemObject.first_name)
//                User.setmail(mail: itemObject.email)
//             //   User.setPhone(Phone: itemObject.mobile)
//                  User.setuserTokene(userToken: itemObject.access_token)
//                User.setUserID(id: itemObject.id)
//                print("Login Token = ",User.userToken())
                Result("Done")
                //Result(itemObject)
            }
                
            else {
                
                Result(data as! String)
                
            }
        }
        
    }
    
    
    
}

