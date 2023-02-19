//
//  InfoViewModel.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/01.
//

import Foundation
import UIKit

class InfoViewModel : ObservableObject{
    @Published var isProgress = false
    
    @Published var infoData: Info?
    @Published var AppImage = [UIImage]()
    let AppID : Int
    
    
    init(AppID: Int){
        self.AppID = AppID
        print(self.AppID)
        getInfoData()
    }
    
    func getInfoData(){
        isProgress = true
        //ロリポップのURLを入れる
        let baseURL = "https://21cm0149.main.jp/sotuseiapp/php/information_json.php"
        // URLに変換
        guard let url = URL(string: baseURL) else { return }
        // URLにパラメータ追加
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "id", value: String(AppID))]
        
        let jsonConverter = JSONConverter(url: components.url!)
        
        jsonConverter.resume() { data, response, error in
            guard let data = data else {
                print("データがありません")
                self.isProgress = false
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let appinfo = try decoder.decode(UserData.self, from: data)
                print("パースできました")
                print(appinfo)
                
                for userData in appinfo.userData {
                    for image in userData.images {
                        let image = self.getImage(urlString: image.imagepath)
                        DispatchQueue.main.async {
                            self.AppImage.append(image)
                        }
                        
                        
                    }
                }
                
                for userData in appinfo.userData {
                    var siteTmp = "記載しません"
                    var movieTmp = "記載しません"
                    
                    var dbFrameTmp = "記載しません"
                    
                    if let site = userData.site {
                        siteTmp = site
                    }
                    if let movie = userData.movie {
                       movieTmp = movie
                    }
                    if let dbFrameWork = userData.dbFramework{
                        dbFrameTmp = dbFrameWork
                    }
                    
                    let info = Info(id: userData.id,
                                    title: userData.title,
                                    developmentBG: userData.haikei,
                                    developmentEV: userData.kankyou,
                                    appOs: userData.os,
                                    language: userData.language,
                                    server: userData.server,
                                    appFrameWork: userData.appFramework,
                                    dbFrameWork: dbFrameTmp,
                                    opusPoint: userData.point,
                                    idea: userData.idea,
                                    notFunction: userData.notFunction,
                                    site: siteTmp,
                                    movie: movieTmp ,
                                    images: self.AppImage)
                    
                    DispatchQueue.main.async {
                        self.infoData = info
                    }
                
                    DispatchQueue.main.async {
                        self.isProgress = false
                    }
                }
                
                
            }catch let err{
                print("できてないよ")
                print(err)
                DispatchQueue.main.async {
                    self.isProgress = false
                }
            }
        }
    }
    func getImage(urlString: String) -> UIImage{
        var uiImage : UIImage = UIImage(named: "image")!
        
        guard let url = URL(string: urlString) else {
            print("URLに変換できませんでした: InfoViewModel")
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
