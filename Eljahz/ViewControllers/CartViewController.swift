//
//  CartViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/22/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var langButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryTableView: UITableView!
    var cartArray = [CartEntity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.register(UINib(nibName: "CartTableViewCell" , bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        categoryTableView.register(UINib(nibName: "BirdsCartTableViewCell" , bundle: nil), forCellReuseIdentifier: "BirdsCartTableViewCell")
        categoryTableView.register(UINib(nibName: "VegetablesCartTableViewCell" , bundle: nil), forCellReuseIdentifier: "VegetablesCartTableViewCell")

        getCart ()

        // Do any additional setup after loading the view.
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
    }
      func getCart () {
          CartManager.Manager.CartManagerM(){
              (data) in
              if let result =  data as? [CartEntity] {
                  self.cartArray = result
                  self.categoryTableView.reloadData()
    
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
extension CartViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let object = cartArray[indexPath.row]

        if object.filterArray[0].type == "1"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
            cell.quantityValueLabel.text = object.quantity
            cell.countLabel.text = indexPath.row.description
            for x in 0..<object.filterArray.count {
                switch object.filterArray[x].parentID {
                case "28","6":
                    print("Type")
                    cell.typeValueLabel.text = object.filterArray[x].nameEn
                case "34":
                    print ("Size")
                    cell.sizeValueLabel.text = object.filterArray[x].nameEn
                case "64":
                    print("Mafrom")
                    cell.mafromValueLabel.text = object.filterArray[x].nameEn
                case "39","9","20","60":
                    print("Cut")
                     cell.cutValueLabel.text = object.filterArray[x].nameEn
                case "44","13","25":
                    print("Taghlef")
                     cell.taghlefValueLabel.text = object.filterArray[x].nameEn
                case "49":
                    print("The head")
                     cell.headValueLabel.text = object.filterArray[x].nameEn
                case "52":
                    print("Elkrsh")
                     cell.elkrshValueLabel.text = object.filterArray[x].nameEn
                case "55":
                    print("Mashawy")
                     cell.mixValueLabel.text = object.filterArray[x].nameEn
                default:
                    print("")
                }
            }
            

            return cell

        }
        else if  object.filterArray[0].type == "2" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BirdsCartTableViewCell", for: indexPath) as! BirdsCartTableViewCell
             cell.quantityValueLabel.text = object.quantity
             cell.countLabel.text = indexPath.row.description
            for x in 0..<object.filterArray.count {
                switch object.filterArray[x].parentID {
                case "28","6":
                    print("Type")
                    cell.typeValueLabel.text = object.filterArray[x].nameEn
        
                case "39","9","20","60":
                    print("Cut")
                     cell.cutValueLabel.text = object.filterArray[x].nameEn
                case "44","13","25":
                    print("Taghlef")
                     cell.taghlefValueLabel.text = object.filterArray[x].nameEn
    
                default:
                    print("")
                }
            }

            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VegetablesCartTableViewCell", for: indexPath) as! VegetablesCartTableViewCell
            cell.quantityValueLabel.text = object.quantity
             cell.countLabel.text = indexPath.row.description
            for x in 0..<object.filterArray.count {
            switch object.filterArray[x].parentID  {
 
                case "20":
                    print("Cut")
                    cell.cutValueLabel.text = object.filterArray[x].nameEn
                case "25":
                    print("Taghlef")
                    cell.taghlefValueLabel.text = object.filterArray[x].nameEn
                case "60":
                    print("The head")
                    cell.cutShapeValueLabel.text = object.filterArray[x].nameEn
                case "17":
                    print("Mix Box")
                    cell.mixBoxValueLabel.text = object.filterArray[x].nameEn

                default:
                    print("")
                }
            }
            
            return cell
        }

        

    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("Cell Press")
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let object = cartArray[indexPath.row]

        if object.filterArray[0].type == "1"{
             return 306
        }
        else if  object.filterArray[0].type == "2" {
            return 170
        }
        else  {
            return 215
        }
        
        
        
       
    }
 
    
}



//
//    switch filterID {
//    case "28","6":
//        print("Type")
//    case "34":
//        print ("Size")
//    case "64":
//        print("Mafrom")
//    case "39","9","20","60":
//        print("Cut")
//    case "44","13","25":
//        print("Taghlef")
//    case "49":
//        print("The head")
//    case "52":
//        print("Elkrsh")
//    case "55":
//        print("Mashawy")
//    case "17":
//        print("Mix Box")
//
//
//
//    default:
//        print("")
//    }
