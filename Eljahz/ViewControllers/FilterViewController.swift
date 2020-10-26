

//
//  FilterViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/21/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var langButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var filtersTableView: UITableView!
    @IBOutlet weak var notesView: UIView!
    @IBOutlet weak var notesSubView: UIView!
    @IBOutlet weak var notesIcon: UIImageView!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    
    var categroyArray = [CategoryEntity]()
    var id = ""
    var productID = ""
 var filterSelectedID = [String]()
     var filterSelectedPrice = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        filtersTableView.register(UINib(nibName: "FilterableViewCell" , bundle: nil), forCellReuseIdentifier: "FilterableViewCell")
        addViewShadow(view: notesView)
        //notesSubView.layer.cornerRadius = 10
        notesSubView.roundCorners(corners: .topLeft, radius: 10)
         notesSubView.roundCorners(corners: .bottomLeft, radius: 10)
         notesView.roundCorners(corners: .topLeft, radius: 10)
        AddButton.layer.cornerRadius = 24

        


        getFilters ()
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
        
                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                         let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
              self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    @IBAction func addButtonAction(_ sender: Any) {
        
        for item in categroyArray {
            for item2 in item.subCategory {
                if item2.checked == true {
                    self.filterSelectedID.append(item2.id)
                    self.filterSelectedPrice.append(item2.price)
                }
            }
        }
        
        let paramter = ["category_id":self.filterSelectedID,"price":self.filterSelectedPrice,"product_id":productID,"quantity":"3"] as [String:AnyObject]
        print("parameter =",paramter)
        AddToCartManager.Manager.AddToCartManagerm(cartParameter: paramter){
            (data) in
              let result = data as? String
            if result == "Done" {
                print(" add to cart Done")
                let alertController = UIAlertController(title: "The product has been added to cart successfully", message: "", preferredStyle: .alert)

                 // Create the actions
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                     UIAlertAction in
                     NSLog("OK Pressed")
                    self.navigationController?.popViewController(animated: false)
                 }
//                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
//                     UIAlertAction in
//                     NSLog("Cancel Pressed")
//                 }

                 // Add the actions
                 alertController.addAction(okAction)
                // alertController.addAction(cancelAction)

                 // Present the controller
                self.present(alertController, animated: true, completion: nil)
            }
            else
            {
                let Result = data as? String
                Utilities.showAlertViewWithTitle(title: Result ?? "Missing Data", msg: "", cancelBtnTitle: "OK")
            }
            
            
        }
        
        
    }
        
      func getFilters () {
          CategoryManager.Manager.categoryManagerM(categoryID: id){
              (data) in
              
              if let result =  data as? [CategoryEntity] {
                  self.categroyArray = result
                  self.filtersTableView.reloadData()
    
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
extension FilterViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categroyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterableViewCell", for: indexPath) as! FilterableViewCell
        
        let object = categroyArray[indexPath.row]
        cell.filterNameLabel.text = object.nameEn
        cell.filterArray = object.subCategory
        cell.filterIcon.image = UIImage(named: getImageName(catId: id, filterID: object.id))
        cell.filterContentCollectionView.reloadData()
       // cell.filterView.layer.cornerRadius = 10
        //cell.filterTypeView.layer.cornerRadius = 10

         
        
        
   
       return cell
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("Cell Press")

        
    }
 func addViewShadow(view:UIView) {
     view.layer.shadowColor = UIColor.black.cgColor
     view.layer.borderColor = UIColor.black.cgColor
   view.layer.borderWidth = 0.1
    view.layer.shadowOpacity = 0.1
      view.layer.shadowOffset = .zero
     view.layer.shadowRadius = 8
   view.layer.cornerRadius = 8
 }
    
    func getImageName(catId:String,filterID:String) -> String{
        
        switch catId {
        case "1":
            print("meat cat")
            if filterID == "28"{
                return "typeIcon"
            }
            else if filterID == "34" {return "weightIcon" }
             else if filterID == "64" {return "mafromIcon" }
             else if filterID == "39" {return "cutIcon" }
             else if filterID == "44" {return "taghlefIcon" }
             else if filterID == "49" {return "headIcon" }
             else if filterID == "52" {return "elkrshIcon" }
             else if filterID == "55" {return "mashawyIcon" }
            
        case "2":
            print("birds cat")
            if filterID == "6"{
                           return "checkenIcon"
                       }
                       else if filterID == "9" {return "cutIcon" }
                        else if filterID == "13" {return "taghlefIcon" }
        case "3":
            print("vegtables cat")
            if filterID == "17"{
                           return "mixBoxIcon"
                       }
                       else if filterID == "20" {return "cutIcon" }
                        else if filterID == "25" {return "taghlefIcon" }
                        else if filterID == "60" {return "cutIcon" }
        default:
            print("default")
        }
        
        
        return ""
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
