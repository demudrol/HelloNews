//
//  NewsManager.swift
//  HelloNews
//
//  Created by Дементьев Николай on 02.06.17.
//  Copyright © 2017 Nikolay. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import SwiftyJSON

class NewsManager {
    func loadJSON() {
        let realm = try! Realm()
        let url = "https://newsapi.org/v1/articles?source=bloomberg&sortBy=top&apiKey=fef75ee33bbb4ea4aa66e6d112a2b8c9"
        let onlineNews = NewsData()
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                onlineNews.newsource = json["source"].stringValue
                for (_, subJson) in json["articles"] {
                    let tmp: TempData = TempData()
                    tmp.author = subJson["author"].stringValue
                    tmp.title = subJson["title"].stringValue
                    tmp.pubtime = subJson["publishedAt"].stringValue
                    tmp.desc = subJson["description"].stringValue
                    tmp.urltoimg = subJson["urlToImage"].stringValue
                    onlineNews.tempList.append(tmp)
                }
                try! realm.write {
                    realm.add(onlineNews, update: true)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    func loadFromDB() -> Results<NewsData> {
        let realm = try! Realm()
        let data = realm.objects(NewsData.self)
        return data
    }
}
