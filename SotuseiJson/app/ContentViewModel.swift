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
    @Published var isLoading = false
    //データある場合:ture データのない場合:false
    @Published var isGetData = false
    
    //    @Published var uiImage : UIImage = UIImage(named: "image")!
    @Published var apps = [AppData]()
    
    var defaultApps = [AppData]()
    
    /// アプリ一覧のリクエスト投げる
    func getData(year : String, event : Int?) {
        // Loadフラグをtrue
        isLoading = true
        let baseURL = "https://21cm0149.main.jp/sotuseiapp/php/app_year.php"
        guard let url = URL(string: baseURL) else { return }
        
        // URLにパラメータ追加
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "year", value: year)]
        
        // もし、eventに値が入っていたら、パラメータを追加
        if let event = event{components.queryItems?.append(contentsOf: [URLQueryItem(name: "event", value: String(event))])}
        
        // URL確認
        print(components.url ?? "")
        // app一覧が入っている配列を空に
        self.apps.removeAll()
        
        let jsonConverter = JSONConverter(url: components.url!)
        jsonConverter.resume() { data, response, error in
            guard let data = data else { // data is not nil
                print("データがありません")
                self.isLoading = false // Loadフラグをfalse
                self.isGetData = false // getDataできなかった
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let applications = try decoder.decode(Apps.self, from: data)
                print("パースできました")
                print(applications)
                
                for app in applications {
                    let appData = AppData(id: app.id,
                                          title: app.title,
                                          icon: self.getImage(urlString: app.icon ?? ""),
                                          year: app.year,
                                          tags: app.tags,
                                          studentID: app.studentID,
                                          eventID: app.eventID,
                                          studentName: app.studentName ?? "")
                    DispatchQueue.main.async {
                        self.apps.append(appData)
                        self.defaultApps.append(appData)
                    }
                }
                
                DispatchQueue.main.async {
                    self.isGetData = true
                    self.isLoading = false
                }
                
            }catch let err{
                print(err)
                self.isLoading = false
                self.isGetData = false
            }
            
        }
    }
    
    func getImage(urlString: String) -> UIImage{
        var uiImage : UIImage = UIImage(named: "image")!
        if urlString != "" {
            
            guard let url = URL(string: urlString) else {
                print("URLに変換できませんでした: ContentViewModel")
                return uiImage
            }
            
            guard let data = try? Data(contentsOf: url) else {
                print("dataに変換できませんでした")
                return uiImage
            }
            uiImage = UIImage(data: data)!
        } else {
            uiImage = UIImage(named: "image")!
        }
        return uiImage
    }
    
    ///  タグで並び替えるやつ
    func repackApps(in selectTag : String) {//🎈
        print("repackApps呼ばれた")
        // 別の配列にタグが一致するものを避難させる
        var repackArray = [AppData]()
        
        for app in defaultApps {
            guard let tags = app.tags else {
                print("repackAppsでリターン")
                return
            }
            for tag in tags {
                if selectTag == tag {
                    repackArray.append(app)
                    print("repackArrayにappend")
                }
            }
        }
        
        // appsを空にする
        apps.removeAll()
        
        // 避難させたのをappsに戻す
        apps = repackArray
    }
    
    /// 文字検索
    func searchName(from word: String) {
        // FIXME: これの方法だと、タグの中で検索するとかはできない
        print("searchName呼ばれた")
        var repackArray = [AppData]()
        for app in apps {
            if app.title.contains(word) { // wordがtitleに含まれていたらtrue
                repackArray.append(app)
            }
        }
        apps.removeAll()
        if !repackArray.isEmpty {
//            apps.removeAll()
            apps = repackArray
        }
    }
}

