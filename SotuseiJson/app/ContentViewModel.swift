//
//  ContentViewModel.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/20.
//

import Foundation
import UIKit

class ContentViewModel : ObservableObject {
    //読み込みの状態
    @Published var isProgress = false
    @Published var title = "titleがはいるよ"
    //    @Published var uiImage : UIImage = UIImage(named: "image")!
    @Published var apps = [AppData]()
    
    init(){
        getData()
        //        getImage(urlString: "http://21cm0149.main.jp/sotuseiapp/icon/test.jpg")
    }
    
    func getData() {
        //        isProgress = true
        
        //ロリポップのURLを入れる
        let jsonConverter = JSONConverter(urlString: "https://21cm0149.main.jp/sotuseiapp/php/app_student_json.php")
        
        self.apps.removeAll()
        
        jsonConverter.resume() { data, response, error in
            guard let data = data else {
                print("データがありません")
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    
                    let applications = try decoder.decode([AppJSON].self, from: data)
                    print("パースできました")
                    print(applications)
                    for app in applications {
                        let app = AppData(id: app.id,
                                          title: app.title,
                                          icon: self.getImage(urlString: app.icon),
                                          year: app.year,
                                          tagID: app.tagID,
                                          studentID: app.studentID,
                                          eventID: app.eventID,
                                          studentName: app.studentName)
                        self.apps.append(app)
                    }
                    
                }catch let err{
             
                    print(err)
                }
            }
        }
    }
    
    func getImage(urlString: String) -> UIImage{
        var uiImage : UIImage = UIImage(named: "image")!
        
        guard let url = URL(string: urlString) else {
            print("URLに変換できませんでした")
            return uiImage
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("dataに変換できませんでした")
            return uiImage
        }
        uiImage = UIImage(data: data)!
        return uiImage
        
    }
}
