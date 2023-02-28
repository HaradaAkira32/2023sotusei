//
//  MyDefaults.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/24.
//

import Foundation
import UIKit

class Defaults {
    
    
    
    var userDefaults = UserDefaults.standard
    
    func seve(id: Int) {
        var getIds = load()
        getIds.append(id)
        userDefaults.set(getIds, forKey: "ids")
    }
    
    func load() -> [Int] {
        let ids : [Int] = userDefaults.array(forKey: "ids") as? [Int] ?? []
        print(ids)
        return ids
    }
    
    /**
            いいねボタンを押した時に、UDの配列の中に一致するものがあるんだったら、そのIDを除外する
     */
    func delete(id:Int){
        var escapeID : [Int] = []
        
        // 読み込んだUDを一個一個取り出します
        for defaultID in load() {
            if id == defaultID{
                //idがあったとき
                print(defaultID)
            }else{
                // idが一致しない（削除対象ではない）
                escapeID.append(defaultID)
            }
        }
        userDefaults.set(escapeID, forKey: "ids")
        
    }
//    func seve(ids: [Int]){
//        // userDefaultsに保存された値の取得
//        var getIds:[Int] = userDefaults.array(forKey: "ids") as! [Int]
//        getIds.append(ids)
//        print(getIds)
//        userDefaults.set(getIds, forKey: "ids")
//    }
    
}

