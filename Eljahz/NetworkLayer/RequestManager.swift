//
//  RequestManager.swift
//  Lensaty
//
//  Created by Kemo on 8/4/19.
//
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



class RequestManager: NSObject {
    static let Request = RequestManager()
 let sessionManager: SessionManager = {
       var sessionManager = SessionManager()
       let configuration = URLSessionConfiguration.default
       configuration.timeoutIntervalForRequest = 40 //timeout can be changed from here
    configuration.timeoutIntervalForResource = 40
       sessionManager = Alamofire.SessionManager(configuration: configuration)
       return sessionManager
   }()
    ////////////// TAKE THE REQUEST PARAMETER LIKE URL ANG GET JSON DATA
    func requestWithParameters(andURL: String,Header: HTTPHeaders? = nil,Meth:HTTPMethod, Parparameters: [String:AnyObject]? = nil ,  Result:@escaping (_ result : Any)->() ) {
        print("URL = " , andURL)
        sessionManager.request(andURL, method: Meth, parameters: Parparameters, encoding: JSONEncoding.default, headers: Header).validate(statusCode: 200..<400)
            .responseJSON {
                response in
                switch response.result {
                case .success:
                    print("Validation Successful",response.result.value)
                    guard let values = JSON (response.result.value as Any) as? JSON else{
                        return
                    }
                    Result(values)
                    print(values)
                    break
                case .failure(let error):
                    let values:JSON = JSON(response.data as Any)
                    print("error body =",values)
//                    if response.response?.statusCode == 409 {
//                        User.setSignout(Signout: true)
//                        User.setuserTokene(userToken: "")
//                        User.setSignout(Signout: true)
//                        User.setuserTokene(userToken: "")
//                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                        let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "EntryViewController") as! EntryViewController
//                        Utilities.getCurrentViewController()!.present(HomeViewController, animated: true, completion: nil)
//
//                         Result("Your session has been expired")
//                        return
//
//                    }
                    
                    
                    
                    
                    if let mss = values["message"].string  {
                        Result(mss)
                    }
                        
                    else{
                        print("ERROR \(error.localizedDescription))")
                          Result(error.localizedDescription)
                       // Result("انتهت مدة الطلب الرجاء المحاولة مرة أخرى")
                    }
                    
                    break
                }
        }
        
        
        
    }
    
    
}

