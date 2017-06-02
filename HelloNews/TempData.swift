//
//  TempData.swift
//  HelloNews
//
//  Created by Дементьев Николай on 02.06.17.
//  Copyright © 2017 Nikolay. All rights reserved.
//

import Foundation
import RealmSwift

class TempData: Object {
    dynamic var author: String = ""
    dynamic var title: String = ""
    dynamic var pubtime: String = ""
    dynamic var desc: String = ""
    dynamic var urltoimg: String = ""
}
