//
//  TextView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/10.
//

import SwiftUI

struct TextView: View {
    var os : String
    var language: String
    var developmentChance : String
    var appPoint : String
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        VStack {
            VStack(alignment: .leading) {
                Text("基本情報")
                    .font(.system(size: screenWidth / 18))
                    .padding(.bottom, 8)
                HStack{
                    VStack(alignment: .leading) {
                        Text("使用OS")
                            .font(.system(size: screenWidth / 23))
                            .padding(5)
                        Text("開発言語")
                            .font(.system(size: screenWidth / 23))
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                    
                    VStack {
                        Text(os)
                            .font(.system(size: screenWidth / 25))
                            .padding(5)
                        Text(language)
                            .font(.system(size: screenWidth / 25))
                    }
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("開発背景")
                        .font(.system(size: screenWidth / 18))
                        .padding(.vertical, 8)
                    
                    Text(developmentChance)
                        .font(.system(size: screenWidth / 25))
                        .padding(.leading, 8)
                }
                
                VStack(alignment: .leading) {
                    Text("アプリポイント")
                        .font(.system(size: screenWidth / 18))
                        .padding(.vertical, 8)
                    
                    Text(appPoint)
                        .font(.system(size: screenWidth / 25))
                        .padding(.leading, 8)
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(os: "iOS",
                 language: "swift",
                 developmentChance: "過去の先輩たちの作品を見る術がない。在校生たちが参考にしたいけど触るだけだとわからないから。どんなツールを使えば作れるのか、機能の詳細を知ることでより参考にできる。アプリ制作の時に先輩の作品と同じ機能を使う際に、参考にできるように。留学生の作品の技術を知りたいけど、言葉の壁がありうまく伝わらない&伝えられない。展示で見れない作品のことも知りたいと思ったので。",
                 appPoint: "ユーザのストレスにならないように動作を軽くして動きにしてます")
    }
}
