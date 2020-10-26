//
//  FilterTypeCollectionViewCell.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/21/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class FilterTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var filterValueLabel: UILabel!
    @IBOutlet weak var checkView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addViewShadow(view: checkView)
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
