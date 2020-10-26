//
//  LoginManager.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/17/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class LoginManager: NSObject {
    static let Manager = LoginManager()
  //  var resultObject:AnyObject? = nil
    func Loginm (LoginParameter: [String : AnyObject],Result:@escaping (_ result : Any)->() ) {
    let header:[String:String] = ["Content-Type" : "application/json"]
        
        RequestManager.Request.requestWithParameters(andURL: login, Header: header, Meth: .post, Parparameters: LoginParameter ){ (data) in
            if let result = data as? JSON {
                
                User.setuserTokene(userToken: "Bearer " + result["access_token"].stringValue)
                print("Login Token = ",User.userToken())
                Result("Done")
                //Result(itemObject)
            }
                
            else {
                
                Result(data as! String)
                
            }
        }
        
    }
    
    
    
}

