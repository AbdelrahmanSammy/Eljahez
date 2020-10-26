//
//  LoadJsonFile.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/22/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//


//import Foundation
//import Alamofire
//import SwiftyJSON
//class LoadOfflinJsonFile: NSObject {
//    static let Manager = SportActivityManager()
//
//    func loadJson(filename fileName: String) -> sportModel? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(sportModel.self, from: data )
//                return jsonData
//            } catch {
//                print("error:\(error)")
//            }
//        }
//        return nil
//    }
//}
//
