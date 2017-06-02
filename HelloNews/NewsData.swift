//
//  NewsData.swift
//  HelloNews
//
//  Created by Дементьев Николай on 02.06.17.
//  Copyright © 2017 Nikolay. All rights reserved.
//

import Foundation
import RealmSwift

class NewsData: Object {
    dynamic var newsource: String = ""
    var tempList = List<TempData>()
    
    override static func primaryKey() -> String? {
        return "newsource"
    }
}
