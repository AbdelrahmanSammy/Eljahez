//
//  CategoryEntity.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/19/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import Foundation

class CategoryEntity:NSObject {
    var id = ""
    var nameAr = ""
    var nameEn = ""
    var products = [ProductEntity]()
    var subCategory = [FilterEntity]()
  
}

class CatEntity:NSObject {
    var id = ""
    var nameAr = ""
    var nameEN = ""
    var image = ""
}
