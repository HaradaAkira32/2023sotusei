//
//  InformationJSON.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/31.
//

import Foundation
import UIKit

struct InfoJSON: Codable {
    var userData: [UserDatum]

    enum CodingKeys: String, CodingKey {
        case userData = "user_data"
    }
}

// MARK: - UserDatum
struct UserDatum: Codable {
    let id: Int
    let haikei : String
    let kankyou : String
    let point : String
    let idea: String
    let notFunction: String
    let site : String
    let movie: String
//    let images : String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case haikei = "haikei"
        case kankyou = "kankyou"
        case point = "point"
        case idea = "idea"
        case notFunction = "not_function"
        case site = "site"
        case movie = "movie"
//        case images = "images"
    }
}

struct Infos: Codable {
    let infos:[InfoJSON]
}

struct InfoData : Identifiable {
    let id: Int
    ///開発背景
    let developmentBG: String
    ///開発環境
    let developmentEV: String
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
//    let images: UIImage
}




//let id = userData.id
//                                let haikei = userData.haikei
//                                let kankyou = userData.kankyou
//                                let point = userData.point
//                                let idea = userData.idea
//                                let notFunciton = userData.idea
//                                let site = userData.site
//                                let movie = String(userData.movie)
//                                let images = self.getImage(urlString: userData.images)
