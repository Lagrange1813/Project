//
//  Restaurant.swift
//  New-FoodPin
//
//  Created by 张维熙 on 2021/11/18.
//

import Foundation

struct Restaurant: Hashable {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var image: String = ""
    var isFavorite: Bool = false
}
