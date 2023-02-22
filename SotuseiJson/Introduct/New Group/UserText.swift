//
//  UserText.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/02/13.
//

import SwiftUI

struct UserText: View {
    
    var notFunction : String
    var site : String?
    var movie : String?
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        VStack{
            HStack {
                VStack(alignment: .leading) {
                    
                    
                    Text("実装したかった機能")
                        .font(.system(size: screenWidth / 18))
                        .padding(.vertical, 8)
                    
                    Text(notFunction)
                        .font(.system(size: screenWidth / 25))
                        .padding(.leading, 8)
                    
                    Text("サイト")
                        .font(.system(size: screenWidth / 18))
                        .padding(.vertical, 8)
                }
                Spacer()
            }
            
            if let site, let url = URL(string: site) {
                Link(destination: url) {
                    Text("サイトにGO")
                        .padding(10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                }
            } else {
                Text("サイトがありません")
                    .font(.system(size: screenWidth / 25))
            }
                
            
            if let movie, let url = URL(string: movie) {
                Link(destination: url) {
                    Text("動画にGO")
                        .padding(10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                }
            } else {
                Text("動画ありません")
                    .font(.system(size: screenWidth / 25))
            }
        } .padding(.horizontal, 10)
    }
}
struct UserText_Previews: PreviewProvider {
    static var previews: some View {
        UserText(notFunction: "お気に入り機能",site: "https://www.jec.ac.jp/")
    }
}
