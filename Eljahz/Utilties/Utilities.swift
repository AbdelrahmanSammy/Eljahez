//
//  Utilities.swift
//  MFP
//
//  Created by Eman Kassem on 11/3/16.
//  Copyright © 2016 Freelancing iOS Team ^_^. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class Utilities: NSObject {
    
    // MARK: - Get Document's Directory -
    
    class func getDocumentsDirectory () -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return documentsPath
    }
    
    // MARK: - Select and Deselect Button -
    
    
    // MARK: - Attributed Strings -
    
    // Stroke through
    
    static func strokedAttributedString(strokedString: String) -> NSMutableAttributedString {
        let attributedString: NSMutableAttributedString =  NSMutableAttributedString(string: strokedString)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    // Colored Range
    
    static func coloredAttributedString(fullString: String, fullStringColor: UIColor, subString: String, subStringColor: UIColor) -> NSMutableAttributedString {
        let range = (fullString as NSString).range(of: subString)
        let attributedString = NSMutableAttributedString(string:fullString)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: fullStringColor, range: NSRange(location: 0, length: fullString.characters.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: subStringColor, range: range)
        
        return attributedString
    }
    
    // MARK: - Show/Hide Status Bar -
    
    class func toogleStatusBar(status: Bool) {
        UIApplication.shared.setStatusBarHidden(status, with: .none)
    }
    
    // MARK: - Show/Hide Loader -
    
    class func showLoader(view:UIView) {
        view.isUserInteractionEnabled = false
        let dimmedView = UIView(frame: view.frame)
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(ALPHA_COMPONENT)
        
        let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: view.frame.midX - LOADER_WIDTH / 2, y: view.frame.midY - LOADER_WIDTH / 2, width: LOADER_WIDTH, height: LOADER_WIDTH), color: .white)
        dimmedView.addSubview(activityIndicatorView)
        view.addSubview(dimmedView)
        activityIndicatorView.startAnimating()
    }
    class func hideLoader(view:UIView) {
        view.isUserInteractionEnabled = true
        let v = view.subviews.last
        v?.removeFromSuperview()
    }
    
    // MARK: - Show Alert -
    
    class func showAlertViewWithTitle(title:String , msg:String, cancelBtnTitle: String) {
        let alert = UIAlertView()
        alert.message = msg
        alert.title = title
        alert.message = msg
        alert.addButton(withTitle: cancelBtnTitle)
        alert.show()
    }
    
    class func showAlertControllerOverController(controller:UIViewController, withTitle:String?, message:String, action:[UIAlertAction]) {
        let alert = UIAlertController(title: withTitle, message: message,preferredStyle: UIAlertController.Style.alert)
        action.forEach { newAction in
            alert.addAction(newAction)
        }
        // Avoid presenting more than alert
        if controller.presentedViewController?.isKind(of:UIAlertController.self) == nil {
            controller.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Loading from Plist -
    
    class func loadArrayFromPlist(fileName:String) -> NSArray {
        let path = Bundle.main.bundlePath + "/" + fileName
        let arr = NSArray(contentsOfFile:path)
        return arr!
    }
    
    class func loadDictionaryFromPlist(fileName:String) -> [String:AnyObject] {
        let path = Bundle.main.bundlePath + "/" + fileName
        let dic = NSDictionary(contentsOfFile:path)
        return dic! as! [String : AnyObject]
    }
    
    // MARK: - Image Utilities -
    
    class func imageByScallingAndCropping(sourceImage:UIImage , forSize:CGSize) -> UIImage {
        var newImage:UIImage?
        let imageSize = sourceImage.size
        let width = imageSize.width
        let height = imageSize.height
        let targetWidth = forSize.width
        let targetHeight = forSize.height
        var scaleFactor = CGFloat(0.0)
        var scaledWidth = targetWidth
        var scaledHeight = targetHeight
        var thumbnailPoint = CGPoint(x: 0.0, y: 0.0)
        
        if (imageSize.equalTo(forSize) == false) {
            let widthFactor = targetWidth / width
            let heightFactor = targetHeight / height
            
            if (widthFactor > heightFactor) {
                scaleFactor = widthFactor // Scale to fit height
            } else {
                scaleFactor = heightFactor
            } // Scale to fit width
            scaledWidth  = width * scaleFactor
            scaledHeight = height * scaleFactor
            
            // Centering the Image
            if (widthFactor > heightFactor) {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            } else if (widthFactor < heightFactor) {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContext(forSize) // this will crop
        
        var thumbnailRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width  = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        if (newImage == nil) {
            print("Could not Scale Image")
        }
        
        // Pop the context to get back to the default
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    class func addImage(sourceImg:UIImage, toImage:UIImage, inRect:CGRect) -> UIImage {
        
        UIGraphicsBeginImageContext(sourceImg.size)
        
        sourceImg.draw(in: CGRect(x: 0, y: 0, width: sourceImg.size.width, height: sourceImg.size.height))
        
        toImage.draw(in: inRect)
        
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result!
    }
    
    class func saveData(data:NSData , atPath:String) {
        print("dataPath = %@",atPath)
        data.write(toFile: atPath, atomically: true)
    }
    
    // MARK: - Detecting Language -
    
    class func getCurrentAlignment() -> NSTextAlignment {
        //        return (CURRENT_LANGUAGE_ID == MFP_LANGUAGES.ENGLISH.rawValue) ? .left : .right
        return .right
    }
    
    class func deviceLanguage() -> String {
        return NSLocale.preferredLanguages[0]
    }
    
    // MARK: - Get View Controller ID -
    
    class func getViewControllerName(ViewControllerName:String) -> String {
        return ViewControllerName
        //        return (CURRENT_LANGUAGE_ID == MFP_LANGUAGES.ARABIC.rawValue) ? ViewControllerName + ARABIC_PREFIX: ViewControllerName
    }
    
    // MARK: - Creates a UIColor from a Hex string -
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func getCurrentViewController() -> UIViewController? {

        // If the root view is a navigation controller, we can just return the visible ViewController
        if let navigationController = getNavigationController() {

            return navigationController.visibleViewController
        }

        // Otherwise, we must get the root UIViewController and iterate through presented views
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {

            var currentController: UIViewController! = rootController

            // Each ViewController keeps track of the view it has presented, so we
            // can move from the head to the tail, which will always be the current view
            while( currentController.presentedViewController != nil ) {

                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil
    }
    class func getNavigationController() -> UINavigationController? {

        if let navigationController = UIApplication.shared.keyWindow?.rootViewController  {

            return navigationController as? UINavigationController
        }
        return nil
    }
}

