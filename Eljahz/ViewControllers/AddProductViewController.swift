

//
//  AddProductViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/19/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var langButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func langButtonAction(_ sender: Any) {
    }
    
    @IBAction func menuButtonAction(_ sender: Any) {
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
    }
    
    @IBAction func locaionButtonAction(_ sender: Any) {
    }
    @IBAction func cartButtonAction(_ sender: Any) {
        
                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                         let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
              self.navigationController?.pushViewController(HomeViewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
