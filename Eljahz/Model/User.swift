 //
 //  User.swift
 //  MFP
 //
 //  Created by ahmed elshobary on 3/25/17.
 //  Copyright © 2017 Eman Kassem. All rights reserved.
 //
 
 import UIKit
 
 class User: NSObject {
    
    class func userToken() -> String {
        return UserDefaults.standard.string(forKey: "userToken") ?? ""
    }
    
    class func setuserTokene(userToken:String? = nil) {
        UserDefaults.standard.set(userToken, forKey: "userToken")
    }
    
    class func userPassword() -> String {
         return UserDefaults.standard.string(forKey: "userPassword") ?? ""
     }
     
     class func setuserPassword(userToken:String? = nil) {
         UserDefaults.standard.set(userToken, forKey: "userPassword")
     }
    
    
    
    class func userAddress() -> String {
        return UserDefaults.standard.string(forKey: "userAddress") ?? ""
    }
    
    class func setuserAddress(userAddress:String? = nil) {
        UserDefaults.standard.set(userAddress, forKey: "userAddress")
    }
    class func userSpeciality() -> String {
        return UserDefaults.standard.string(forKey: "userSpeciality") ?? ""
    }
    
    class func setuserSpeciality(userSpeciality:String? = nil) {
        UserDefaults.standard.set(userSpeciality, forKey: "userSpeciality")
    }
    
    
    class func isFirstTime() -> Bool {
        return UserDefaults.standard.bool(forKey: "isFirstTime")
    }
    
    class func setisFirstTime(isFirstTime:Bool) {
        UserDefaults.standard.set(isFirstTime, forKey: "isFirstTime")
    }
    
    
    class func isSkip() -> Bool {
        return UserDefaults.standard.bool(forKey: "isSkip")
    }
    
    class func setisSkip(isSkip:Bool) {
        UserDefaults.standard.set(isSkip, forKey: "isSkip")
    }
    
    
    
    class func isAdemin() -> Bool {
        return UserDefaults.standard.bool(forKey: "isAdemin")
    }
    
    class func setisAdemin(isAdemin:Bool) {
        UserDefaults.standard.set(isAdemin, forKey: "isAdemin")
    }
    class func userID() -> String {
        return UserDefaults.standard.string(forKey: "UserID") ?? "0"
    }
    
    class func setUserID(id:String) {
        UserDefaults.standard.set(id, forKey: "UserID")
    }
    
    class func mobileNO() -> String {
        return UserDefaults.standard.string(forKey: "Mobile")!
    }
    
    class func setMobileNO(number:String) {
        UserDefaults.standard.set(number, forKey: "Mobile")
    }
    
    
    class func setUserActivate(status:Bool) {
        UserDefaults.standard.set(status, forKey: "isActivate")
    }
    
    class func UserActivate() -> Bool {
        return UserDefaults.standard.bool(forKey: "isActivate")
    }
    
    class func countryID() -> String {        
        if let countryID = UserDefaults.standard.string(forKey: "countryID") {
            return countryID
        }
        return ""
    }
    
    class func setcountryID(countryID:String) {
        UserDefaults.standard.set(countryID, forKey: "countryID")
    }
    class func countryName() -> String {
        if let country_name = UserDefaults.standard.string(forKey: "countryName") {
            return country_name
        }
        return ""
    }
    
    class func setcountryName(countryName:String) {
        UserDefaults.standard.set(countryName, forKey: "countryName")
    }
    class func cityID() -> String {
        return UserDefaults.standard.string(forKey: "cityID")!
    }
    
    class func setcityID(cityID:String) {
        UserDefaults.standard.set(cityID, forKey: "cityID")
    }
    class func cityName() -> String {
        return UserDefaults.standard.string(forKey: "cityName")!
    }
    
    class func setcityName(cityName:String? = nil){
        UserDefaults.standard.set(cityName, forKey: "cityName")
    }
    
    class func catogeryID() -> String {
        return UserDefaults.standard.string(forKey: "catogeryID")!
    }
    
    class func setcatogeryID(catogeryID:String) {
        UserDefaults.standard.set(catogeryID, forKey: "catogeryID")
    }
    class func catogeryName() -> String {
        return UserDefaults.standard.string(forKey: "catogeryName")!
    }
    
    class func setcatogeryName(catogeryName:String) {
        UserDefaults.standard.set(catogeryName, forKey: "catogeryName")
    }
    
    class func subcatogeryID() -> String {
        return UserDefaults.standard.string(forKey: "subcatogeryID")!
    }
    
    class func setsubcatogeryID(subcatogeryID:String) {
        UserDefaults.standard.set(subcatogeryID, forKey: "subcatogeryID")
    }
    class func subcatogeryName() -> String {
        return UserDefaults.standard.string(forKey: "subcatogeryName")!
    }
    
    class func setsubcatogeryName(subcatogeryName:String) {
        UserDefaults.standard.set(subcatogeryName, forKey: "subcatogeryName")
    }
    class func model() -> String {
        return UserDefaults.standard.string(forKey: "model")!
    }
    
    class func setmodel(model:String) {
        UserDefaults.standard.set(model, forKey: "model")
    }
    class func carImage() -> String {
        return UserDefaults.standard.string(forKey: "carImage")!
    }
    
    class func setcarImage(carImage:String? = nil) {
        UserDefaults.standard.set(carImage, forKey: "carImage")
    }
    class func appImage() -> String {
        return UserDefaults.standard.string(forKey: "appImage")!
    }
    
    class func setappImage(appImage:String) {
        UserDefaults.standard.set(appImage, forKey: "appImage")
    }
    class func userName() -> String {
 
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            return userName
        }
        return ""
    
    }
    
    class func setuserName(userName:String? = nil) {
        UserDefaults.standard.set(userName, forKey: "userName")
    }
    
    class func mail() -> String {
        return UserDefaults.standard.string(forKey: "mail")!
    }
    
    class func setmail(mail:String) {
        UserDefaults.standard.set(mail, forKey: "mail")
    }
    
    class func DetailsProductImage() -> String {
        return UserDefaults.standard.string(forKey: "DetailsProductImage") ?? ""
    }
    
    class func setDetailsProductImage(DetailsProductImage:String) {
        UserDefaults.standard.set(DetailsProductImage, forKey: "DetailsProductImage")
    }
    
    class func DetailsProfileImage() -> String {
        return UserDefaults.standard.string(forKey: "DetailsProfileImage") ?? ""
    }
    
    class func setDetailsProfileImage(DetailsProfileImage:String) {
        UserDefaults.standard.set(DetailsProfileImage, forKey: "DetailsProfileImage")
    }
    
    class func ProviderName() -> String {
        return UserDefaults.standard.string(forKey: "ProviderName") ?? ""
    }
    
    class func setProviderName(ProviderName:String) {
        UserDefaults.standard.set(ProviderName, forKey: "ProviderName")
    }
    
    class func ProductTitle() -> String {
        return UserDefaults.standard.string(forKey: "ProductTitle") ?? ""
    }
    
    class func setProductTitle(ProductTitle:String) {
        UserDefaults.standard.set(ProductTitle, forKey: "ProductTitle")
    }
    
    class func ProductPrice() -> String {
        return UserDefaults.standard.string(forKey: "ProductPrice") ?? ""
    }
    
    class func setProductPrice(ProductPrice:String) {
        UserDefaults.standard.set(ProductPrice, forKey: "ProductPrice")
    }
    class func ProductID() -> String {
        return UserDefaults.standard.string(forKey: "ProductID") ?? ""
    }
    
    class func setProductID(ProductID:String) {
        UserDefaults.standard.set(ProductID, forKey: "ProductID")
    }
    class func Currenc_code() -> String {
        return UserDefaults.standard.string(forKey: "Currenc_code") ?? ""
    }
    
    class func setCurrenc_code(Currenc_code:String) {
        UserDefaults.standard.set(Currenc_code, forKey: "Currenc_code")
    }
    
    class func Search_ServicesID() -> String {
        return UserDefaults.standard.string(forKey: "Search_ServicesID") ?? ""
    }
    
    class func setSearch_ServicesID(Search_ServicesID:String) {
        UserDefaults.standard.set(Search_ServicesID, forKey: "Search_ServicesID")
    }
    
    class func Search_SearchTextValue() -> String {
        return UserDefaults.standard.string(forKey: "Search_SearchTextValue") ?? ""
    }
    
    class func setSearch_SearchTextValue(Search_SearchTextValue:String) {
        UserDefaults.standard.set(Search_SearchTextValue, forKey: "Search_SearchTextValue")
    }
    
    class func Search_cityID() -> String {
        return UserDefaults.standard.string(forKey: "Search_cityID") ?? ""
    }
    
    class func setSearch_cityID(Search_cityID:String) {
        UserDefaults.standard.set(Search_cityID, forKey: "Search_cityID")
    }
    
    
    class func Search_filter() -> String {
        return UserDefaults.standard.string(forKey: "Search_filter") ?? ""
    }
    
    class func setSearch_filter(Search_filter:String) {
        UserDefaults.standard.set(Search_filter, forKey: "Search_filter")
    }
    
    class func Search_link() -> String {
        return UserDefaults.standard.string(forKey: "Search_link") ?? ""
    }
    
    class func setSearch_link(Search_link:String) {
        UserDefaults.standard.set(Search_link, forKey: "Search_link")
    }
    
    class func Order_ID() -> String {
        return UserDefaults.standard.string(forKey: "Order_ID") ?? ""
    }
    
    class func setOrder_ID(Order_ID:String) {
        UserDefaults.standard.set(Order_ID, forKey: "Order_ID")
    }
    
    class func Phone() -> String {
        return UserDefaults.standard.string(forKey: "Phone") ?? ""
    }
    
    class func setPhone(Phone:String) {
        UserDefaults.standard.set(Phone, forKey: "Phone")
    }
    
    class func FireBaseToken() -> String {
        return UserDefaults.standard.string(forKey: "FireBaseToken") ?? ""
    }
    
    class func setFireBaseToken(FireBaseToken:String) {
        UserDefaults.standard.set(FireBaseToken, forKey: "FireBaseToken")
    }
    class func Signout() -> Bool {
        return UserDefaults.standard.bool(forKey: "Signout")
    }
    
    class func setSignout(Signout:Bool) {
        UserDefaults.standard.set(Signout, forKey: "Signout")
    }
    class func Nextpage() -> String {
        return UserDefaults.standard.string(forKey: "Nextpage") ?? ""
    }
    
    class func setNextpage(Nextpage:String) {
        UserDefaults.standard.set(Nextpage, forKey: "Nextpage")
    }
    
    class func CartCount() -> String {
        if let cardCount = UserDefaults.standard.string(forKey: "CartCount") {
            return cardCount
        }
        return "0"
    }
    
    class func setCartCount(CartCount:String? = nil) {
        UserDefaults.standard.set(CartCount, forKey: "CartCount")
    }
    
    
    class func userLang() -> String {
        return UserDefaults.standard.string(forKey: "userLang") ?? ""
    }
    
    class func setuseruserLang(userLang:String? = nil) {
        UserDefaults.standard.set(userLang, forKey: "userLang")
    }

    
 }

