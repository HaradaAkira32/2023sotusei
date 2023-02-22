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
    
//    let width = UIScreen.main.bounds.width
    
    let screenWidth = UIScreen.main.bounds.width
    
    var width:CGFloat {
        let device = UIDevice.current.userInterfaceIdiom
        if device == .phone {
            return UIScreen.main.bounds.width * 0.9
        } else if device == .pad {
            return UIScreen.main.bounds.width * 0.9
        } else {
            return UIScreen.main.bounds.width
        }
        
    }
    
    var body: some View {
       
        ZStack {
            // 背景の白いカード
//            Rectangle()
//                .frame(width: width * 0.95, height: 180)
//                .foregroundColor(Color("appCardBackColor"))
//                .cornerRadius(10.0)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 30)
//                        .stroke(Color.gray, lineWidth: 0.5)
//                )
//                .cornerRadius(30)
//
            HStack {
                Spacer()
                    .frame(width: screenWidth / 10)
                
                //アイコン画像
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Image(uiImage:app.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width / 3, height: width / 3)
                        .cornerRadius(20.0)
                        .foregroundColor(Color(uiColor: .systemMint))
                } else if UIDevice.current.userInterfaceIdiom == .pad {
                    Image(uiImage:app.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width / 5.5, height: width / 5.5)
                        .cornerRadius(20.0)
                        .foregroundColor(Color(uiColor: .systemMint))
                }
                
                
                
                Spacer()
                
                
                // アプリ名、学生情報
                VStack {
                    
                    // FIXME: この辺は、長さによって大きさを変えたいねぇ…
                    Text(app.title)
                        .foregroundColor(.gray)
                        .font(.system(size: width / 14))
                        .frame(width: width / 2, alignment: .leading)
                    
                    Text(app.studentID)
                        .foregroundColor(Color(.lightGray))
                        .font(.system(size: width / 28))
                        .frame(width: width / 2, alignment: .leading)
                        
                    
                    //タグ
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(app.tags ?? [""], id:\.self) { tag in
                                Text(tag)
                                    .padding(5)
                                    .font(.system(size: width / 35))
//                                    .frame(width: width / 17)
                                
                                    .foregroundColor(.white)
                                    .background(Color("ceramic"))
                                    .cornerRadius(5)
                                
                            }
                        }
                    }
                    .frame(width: width / 2, alignment: .leading)
                    
                }
                .frame(width: width / 2, alignment: .leading)
                
                Spacer()
                // ボタンでこのView使うと色変になるから防止のために色を指定する
                    .foregroundColor(.black)
            }// HStack
            //カードの背景
            .padding()
            .frame(width: width, height: 180)
            //                .cornerRadius(10.0)
            .background(Color("appCardBackColor"))
//            .overlay(
//                RoundedRectangle(cornerRadius: 25)
//                    .stroke(Color.gray, lineWidth: 0.5)
//            )
                .cornerRadius(20)
        }
        
        
        .onTapGesture {
            isShowing.toggle()
        }
        .fullScreenCover(isPresented: $isShowing) {
            IntroductionView(isShowFullScreen: $isShowing, appID: app.id)
        }
    }
}
