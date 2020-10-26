
//
//  CartTableViewCell.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/22/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeValueLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeValueLabel: UILabel!
    @IBOutlet weak var cutLabel: UILabel!
    @IBOutlet weak var cutValueLabel: UILabel!
    @IBOutlet weak var taghlefLabel: UILabel!
    @IBOutlet weak var taghlefValueLabel: UILabel!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var headValueLabel: UILabel!
    @IBOutlet weak var elkrshLabel: UILabel!
    @IBOutlet weak var elkrshValueLabel: UILabel!
    @IBOutlet weak var mixLabel: UILabel!
    @IBOutlet weak var mixValueLabel: UILabel!
    @IBOutlet weak var mafromLabel: UILabel!
    @IBOutlet weak var mafromValueLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addViewShadow(view: cartView)
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
