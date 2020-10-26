//
//  CategoryViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/19/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var langButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryTableView: UITableView!
    
    var categroyArray = [CategoryEntity]()
    var catArray = [CatEntity]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell" , bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")

       //  getCategory ()
        setCatEntity ()
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


    func setCatEntity () {
        let itemObject1 = CatEntity()
        itemObject1.id = "1"
        itemObject1.nameAr = "لحوم"
        itemObject1.nameEN = "Meat"
        itemObject1.image = "HomeImage"
        catArray.append(itemObject1)
        let itemObject2 = CatEntity()
        itemObject2.id = "2"
        itemObject2.nameAr = "طيور"
        itemObject2.nameEN = "Birds"
        itemObject2.image = "HomeImage"
        catArray.append(itemObject2)
        let itemObject3 = CatEntity()
        itemObject3.id = "3"
        itemObject3.nameAr = "خضراوات"
        itemObject3.nameEN = "Vegtables"
        itemObject3.image = "HomeImage"
        catArray.append(itemObject3)
        
        
        
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
extension CategoryViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        let object = catArray[indexPath.row]
        cell.categoryLabel.text = object.nameEN
        cell.categoryImageView.image = UIImage(named: object.image)
        cell.categoryView.layer.borderWidth = 2
        cell.categoryView.layer.borderColor = UIColor.orange.cgColor
        cell.categoryView.layer.cornerRadius = 8
        cell.categoryImageView.layer.cornerRadius = 8

       return cell
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let object = catArray[indexPath.row]
             let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
          HomeViewController.productID = object.id
             // self.present(HomeViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(HomeViewController, animated: true)
        print("Cell Press")
        
    }
 
    
}
