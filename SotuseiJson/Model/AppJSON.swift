//
//  ResponseApp.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/20.
//

import Foundation
import SwiftUI

//appテーブル
struct AppJSON : Codable, Identifiable {
    let id: Int
    let studentName: String?
    let title: String
    let icon: String?
    let year: String
    let tags: [String]
    let studentID: String
    let eventID: Int

    enum CodingKeys: String, CodingKey {
        case id
        case studentName = "student_name"
        case title, icon, year, tags
        case studentID = "student_id"
        case eventID = "event_id"
    }
}

typealias Apps = [AppJSON]

//struct Apps: Codable {
//    let apps: [AppJSON]
//}

struct AppData: Identifiable {
    let id: Int
    let title: String
    let icon: UIImage
    let year: String
    let tags: [String]?
    let studentID: String
    let eventID: Int
    let studentName: String
}



//[
//    {
//        "id": 13,
//        "student_name": null,
//        "title": "Quicha",
//        "icon": null,
//        "year": "2023",
//        "tags": [],
//        "student_id": "21cm0113",
//        "event_id": 2
//    },
//    {
//        "id": 46,
//        "student_name": null,
//        "title": "JECNOTE",
//        "icon": "http://21cm0149.main.jp/sotuseiapp/icon/21cm46_JECNOTE.png",
//        "year": "2023",
//        "tags": [
//            "Android"
//        ],
//        "student_id": "21cm0146",
//        "event_id": 2
//    }
//]
