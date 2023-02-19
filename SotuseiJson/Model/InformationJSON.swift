//
//  InformationJSON.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/31.
//

import Foundation
import UIKit

struct UserData: Codable {
    var userData: [InfoJSON]

    enum CodingKeys: String, CodingKey {
        case userData = "user_data"
    }
}

// MARK: - UserDatum
struct InfoJSON: Codable {
    let id : Int
    let title : String
    let haikei : String
    let kankyou : String
    let os : String
    let language : String
    let server : String
    let appFramework: String
    let dbFramework : String?
    let point : String
    let idea : String
    let notFunction : String
    let site : String?
    let movie : String?
    let images : [Photos]
    
    enum CodingKeys: String, CodingKey {
                case id, title, haikei, kankyou
                case os = "OS"
                case language, server
                case appFramework = "app_Framework"
                case dbFramework = "db_Framework"
                case point, idea
                case notFunction = "not_function"
                case site, movie, images
    }
}

struct Photos : Codable {
    let imagepath : String
    
    enum Codingkeys: String, CodingKey {
        case imagepath
    }
}

struct Infos: Decodable {
    let infos:[InfoJSON]
}

struct Info : Identifiable {
    let id: Int
    ///アプリタイトル
    let title : String
    ///開発背景
    let developmentBG: String
    ///開発環境
    let developmentEV: String
    ///スマホos
    let appOs: String
    ///開発言語
    let language : String
    ///使用サーバー
    let server : String
    ///アプリ側利用フレームワーク
    let appFrameWork : String
    ///データベース側フレームワーク
    let dbFrameWork : String
    ///作品のポイント
    let opusPoint: String
    ///作品のアイデア
    let idea : String
    ///未実装の機能
    let notFunction: String
    ///載せたいサイト
    let site: String
    ///動画のURL
    let movie: String
    ///アプリ内の画面
    let images: [UIImage]
}

//    "user_data": [
//        {
//            "id": 1,
//            "title": "テスト",
//            "haikei": "テスト",
//            "kankyou": "テスト",
//            "point": "テスト",
//            "idea": "テスト",
//            "not_function": "テスト",
//            "site": "https://www.jec.ac.jp/",
//            "movie": "https://www.youtube.com/watch?v=0Y2a4Oxew8E",
//            "images": "http://21cm0149.main.jp/sotuseiapp/gamen/test.png"
//        },
//        {
//            "id": 1,
//            "title": "テスト",
//            "haikei": "テスト",
//            "kankyou": "テスト",
//            "point": "テスト",
//            "idea": "テスト",
//            "not_function": "テスト",
//            "site": "https://www.jec.ac.jp/",
//            "movie": "https://www.youtube.com/watch?v=0Y2a4Oxew8E",
//            "images": "http://21cm0149.main.jp/sotuseiapp/gamen/test2.png"
//        }
//    ]
//}
