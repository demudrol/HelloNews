//
//  ViewController.swift
//  HelloNews
//
//  Created by Дементьев Николай on 02.06.17.
//  Copyright © 2017 Nikolay. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let manager = NewsManager()
        manager.loadJSON()
        let data = manager.loadFromDB()
        print(data)
        
    }

}

