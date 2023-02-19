//
//  AppCardView.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/27.
//

import SwiftUI

struct AppCardView2: View {
    @State var isShowing = false
    let app: AppData
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            // 背景の白いカード
            Rectangle()
                .frame(width: width * 0.95, height: 180)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .cornerRadius(30)
            
            HStack {
                Image(uiImage:app.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .cornerRadius(20.0)
                    .foregroundColor(Color(uiColor: .systemMint))
                Spacer()
                    .frame(width: 160)
            }
            
            // アプリ名、名前
            HStack {
                Spacer()
                    .frame(width: 80)
                VStack {
                    
                    // FIXME: この辺は、長さによって大きさを変えたいねぇ…
                    Text(app.title)
                        .font(.title3)
                        .padding(.bottom)
                    Text(app.studentID)
                        .font(.caption)
//                    Text(app.studentName)
//                        .font(.caption)
                }
                // ボタンでこのView使うと色変になるから防止のために色を指定する
                .foregroundColor(.black)
            }
        }
        .onTapGesture {
            isShowing.toggle()
        }
        .fullScreenCover(isPresented: $isShowing) {
            IntroductionView(isShowFullScreen: $isShowing, appID: app.id)
        }
    }
}

struct AppCardView: View {
    let appIcon: UIImage
    let title: String
    let studentID: String
    let studentName: String
    
    var body: some View {
        
        ZStack {
            // 背景の白いカード
            Rectangle()
                .frame(width: 365, height: 180)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .cornerRadius(30)
            
            HStack {
                //                アプリのアイコン。ここは画像をどういう扱いするかで変わる。
                Image(uiImage:appIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .cornerRadius(20.0)
                
                    .foregroundColor(Color(uiColor: .systemMint))
                Spacer()
                    .frame(width: 160)
            }
            
            // アプリ名、名前
            HStack {
                Spacer()
                    .frame(width: 80)
                VStack {
                    
                    // FIXME: この辺は、長さによって大きさを変えたいねぇ…
                    Text(title)
                        .font(.title3)
                        .padding(.bottom)
                    Text(studentID)
                        .font(.caption)
                    Text(studentName)
                        .font(.caption)
                }
                // ボタンでこのView使うと色変になるから防止のために色を指定する
                .foregroundColor(.black)
            }
        }
    }
}


//struct AppCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppCardView(appIcon: UIImage(named: "image")!, title: "demo", studentID: "21cm0100", studentName: "山田太郎")
//    }
//}
