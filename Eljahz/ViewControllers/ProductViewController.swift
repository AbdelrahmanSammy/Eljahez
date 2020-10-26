

//
//  ProductViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/21/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit
import Kingfisher
class ProductViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var langButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
 //   @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryView: UIView!
    
    var categroyArray = [CategoryEntity]()

    var productsArray = [ProductEntity]()
    var productID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
     categoryCollectionView.register(UINib(nibName: "HomeCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        getProduct ()
        // Do any additional setup after loading the view.
    }
    
      func getCategory () {
          CategoryManager.Manager.categoryManagerM(categoryID: "1"){
              (data) in
              
              if let result =  data as? [CategoryEntity] {
                  self.categroyArray = result
                  self.categoryCollectionView.reloadData()
    
              }
              else {
                  let Result = data as? String
                 Utilities.showAlertViewWithTitle(title: Result ?? "Missing Data", msg: "", cancelBtnTitle: "OK")
              }
          }
      }
    @IBAction func langButtonAction(_ sender: Any) {
     }
     
     @IBAction func menuButtonAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
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
    
    
    func getProduct () {
        ProductManager.Manager.ProductManagerM(productID: self.productID){
            (data) in
            if let result =  data as? [ProductEntity] {
                          self.productsArray = result
                          self.categoryCollectionView.reloadData()
            
                      }
                      else {
                          let Result = data as? String
                         Utilities.showAlertViewWithTitle(title: Result ?? "Missing Data", msg: "", cancelBtnTitle: "OK")
                      }
        }
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
extension ProductViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let object = productsArray[indexPath.row]
        cell.cellTitle.text = object.nameEn
       // cell.cellImage.image = UIImage(named: "")
        let imageUrl = "http://159.69.107.22/eljahz/public/storage/" + productID + object.image
        //cell.cellImage.kf.setImage(with: URL(string:imageUrl))
        cell.cellImage.kf.setImage(with: URL(string:imageUrl), placeholder: UIImage(named: "HomeImage"))
        

        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let object = productsArray[indexPath.row]
           let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                 let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        HomeViewController.id = productID
        HomeViewController.productID = object.id
         self.navigationController?.pushViewController(HomeViewController, animated: true)
        
              //   self.present(HomeViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.categoryCollectionView.bounds.width/2 - 20)
        return CGSize(width: width , height: 140)
        
    }
}
