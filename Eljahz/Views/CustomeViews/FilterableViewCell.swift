//
//  FilterableViewCell.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/21/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class FilterableViewCell: UITableViewCell {
    @IBOutlet weak var filterTypeView: UIView!
    @IBOutlet weak var filterIcon: UIImageView!
    @IBOutlet weak var filterNameLabel: UILabel!
    @IBOutlet weak var filterContentCollectionView: UICollectionView!
    @IBOutlet weak var filterView: UIView!
    
    var filterArray = [FilterEntity]()
   
    override func awakeFromNib() {
        super.awakeFromNib()
        filterContentCollectionView.register(UINib(nibName: "FilterTypeCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "FilterTypeCollectionViewCell")

        filterContentCollectionView.delegate = self
        filterContentCollectionView.dataSource = self
        
      //   addViewShadow(view: filterView)
//     filterTypeView.roundCorners(corners: .topLeft, radius: 10)
//    filterTypeView.roundCorners(corners: .bottomLeft, radius: 10)
//        filterView.roundCorners(corners: .topLeft, radius: 10)
        
        
        filterView.layer.shadowColor = UIColor.black.cgColor
           filterView.layer.borderColor = UIColor.black.cgColor
         filterView.layer.borderWidth = 0.1
          filterView.layer.shadowOpacity = 0.1
            filterView.layer.shadowOffset = .zero
           filterView.layer.shadowRadius = 8
         filterView.layer.cornerRadius = 8
       
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
       
}
    extension FilterableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterTypeCollectionViewCell", for: indexPath) as! FilterTypeCollectionViewCell
        let object = filterArray[indexPath.row]
    
        cell.filterValueLabel.text = object.nameEn
       
        if object.checked == true {
                 
             cell.checkImageView.image = #imageLiteral(resourceName: "checkedIcon")
                            
                              
                         }
                         else {
                             
                          
             cell.checkImageView.image = #imageLiteral(resourceName: "emptyCheckIcon")
                           

                         }
        
        return cell
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let object = filterArray[indexPath.row]
//             if object.checked == true {
//                           object.checked = false
//                if checkIfIDExist(id: object.id) == false {
//                    self.filterSelectedID.append(object.id)
//                }
//                filterContentCollectionView.reloadData()
//
//                       }
//                       else {
//
//                           object.checked = true
//                           filterContentCollectionView.reloadData()

                     //  }
            
            
            for item in filterArray {
                              item.checked = false
                          }
            if object.checked == false {
              
                object.checked = true
                filterContentCollectionView.reloadData()
            }
            else {
                object.checked = false
                filterContentCollectionView.reloadData()
            }
            
            
        }
    
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let width = (self.c.bounds.width/2)
        return CGSize(width: 100 , height: 70)
        
    }
        
  
}
