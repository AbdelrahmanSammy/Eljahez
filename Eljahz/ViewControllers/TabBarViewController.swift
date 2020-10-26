//
//  TabBarViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/19/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController,UITabBarControllerDelegate {
    let unSelectedColor   = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()

      //  self.tabBar.layer.cornerRadius = 12
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.barStyle = .blackOpaque
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:.normal)
        //self.tabBar.frame.size.height = 75
       

   
        
    }
    override func viewWillAppear(_ animated: Bool) {
//
        guard let items = tabBar.items else { return }
//
//        items[0].title = "home_Key".localized
//        items[1].title = "video_Key".localized
//        items[2].title = "offer_Key".localized
//        items[3].title = "cart_Key".localized
//        items[4].title = "myAccount_Key".localized
        
    
        
    }
    
  

    
  
    
    


}
extension UITabBar {
    
//    override open func sizeThatFits(_ size: CGSize) -> CGSize {
//        var sizeThatFits = super.sizeThatFits(size)
//        sizeThatFits.height = 65 // adjust your size here
//        return sizeThatFits
//    }
    
}
class TabBar: UITabBar {
    private var cachedSafeAreaInsets = UIEdgeInsets.zero
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = window.safeAreaInsets.bottom + 65
        return sizeThatFits
    }
    
    
}
