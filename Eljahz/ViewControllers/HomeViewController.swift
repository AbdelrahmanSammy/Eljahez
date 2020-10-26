
//
//  HomeViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/19/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var langButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var smallProjectLabel: UILabel!
    @IBOutlet weak var smallProjectCollectionView: UICollectionView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountCollectionView: UICollectionView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var smallProjectView: UIView!
    @IBOutlet weak var discountView: UIView!
    
    var categroyArray = [CategoryEntity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(UINib(nibName: "HomeCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        smallProjectCollectionView.register(UINib(nibName: "HomeCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        discountCollectionView.register(UINib(nibName: "HomeCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
         getCategory ()
        addViewShadow(view: categoryView)
        addViewShadow(view: smallProjectView)
        addViewShadow(view: discountView)

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
    
    func addViewShadow(view:UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.borderColor = UIColor.black.cgColor
      view.layer.borderWidth = 0.1
       view.layer.shadowOpacity = 0.1
         view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
      view.layer.cornerRadius = 8
    }
    
    func getCategory () {
        CategoryManager.Manager.categoryManagerM(categoryID: "1"){
            (data) in
            
            if let result =  data as? [CategoryEntity] {
                self.categroyArray = result
                self.categoryCollectionView.reloadData()
                self.smallProjectCollectionView.reloadData()
                self.discountCollectionView.reloadData()
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

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categroyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let object = categroyArray[indexPath.row]
        cell.cellTitle.text = object.nameEn
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let width = (self.c.bounds.width/2)
        return CGSize(width: 120 , height: 120)
        
    }
}
