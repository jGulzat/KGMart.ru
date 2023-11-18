//
//  Goods.swift
//  KGMart
//
//  Created by Gulzat on 17/11/23.
//

import Foundation

struct Good {
    var name: String
    var brand: String
    var image: String
    var count: Int
}

//enum Fabricator {
//    case Alkan, Djunhay, Shanhay
//}


struct Fabricator {
    var name: String
    var brand: [String]
    var goods: [Good]
    var isOpen: Bool = false
    var logo: String
}
